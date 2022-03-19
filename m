Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7F84DE96D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 17:55:31 +0100 (CET)
Received: from localhost ([::1]:42346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVcMU-0005Ey-Gs
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 12:55:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nVbbz-0001Rn-8u
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 12:07:27 -0400
Received: from sonic312-24.consmr.mail.gq1.yahoo.com ([98.137.69.205]:44320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nVbbx-0006zB-CZ
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 12:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647706042; bh=JhJweJLIGbjnJ0JKv2zGIkO3eQHikWdp2g/KkeRgWC8=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=khLSrVGQ8k7gwLRITbalxMJWEXndhR0FgVQTuIK74uaMru21eJjvajCTkk6DxEROyXDcMmUuZk79C+/ZNwQbUSmtib40ik1Jb19DWewac7BckztqD1Wcm0qLn9NGnTKwmxpr6jBsTbaHhzlsqLhKBLC208rGAmtSLyLLucCUNHEE0U0UQJUwpdN717HEiu97vv2UUcIT8ssW0IlZctrZRpkIqOwpcct60d3gmW14ibaUoJKUUs5M5wBjUFMfK/fxcW86VZZuiktK+xyr+YQyBZ6h6KR4L48wnT8tXKjPoijnHe4ygXqG+oBUEV9NKg7Q6dQFtJaAmbDRu5xCe7Qy2w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647706042; bh=4YGdSk+R249NNSwqezjr1GulJeN15OvRmZfGJ/D41By=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=obtiFuVKg1QV54y68F8UHBVxnU4oUPUDgQ6KW5ghJQsJUV7vpg7VEwyQkO7hxsKt69ktEfc2eChHwCD8m0esSo8nmpb3xZOobQ0I9SAo5CvCFbSDT835Aye15VtbvOR+Y5WHWYsQyYh59tNJToOQvO81elzFZPGrj2/vW3oc+CjKGH9RsTlfLeju1QzB9ZcSxMV0c1hxjJJDzVIh+sTaxCo7c10ECA/RTzGR5txKjGJNqWS/FRvLXyW06AxQxREXb9T24hmQjp5rrwOhQab3/q6/uDyIkfVlC5dxfrghJ+xyIApTNa8QfbU79sSptu/2A+UG1LOCdokyvdwQBXeJ/w==
X-YMail-OSG: 0kvIchEVM1mrSSkJSGSOhsEdNHzekMljAjZ1uDrjBzINvyMIAKwW5WSa_cuEev2
 OXBkKOjZrL0vd05Hq5ciuCgLZAwVAh9lUzpaSDPEk2Q_WV3ZLUf8wr9s0HCpzhjjgokTNevEdzIp
 .M_ycjUrJ9wGUrXIa8uAsw_t3RX12BZLqnhCnh_r1wIOaNzM5NioKcA1nJpZDJWsGqjL.3qtzaFn
 frcxkQYS50UknDE3QQ06_iBBGJ1wc.q3gjGAwxzRalkcBp9DngUXS53V4MmX89sF5Pm3xdcAcxqN
 HD6DIYbkCgU0Z09aNVtzRBnBRpzw_eSWgUcQau2JDOKLyN7H1u0F9C8SFflEWRgujrE63ThUK_4M
 e7M.B.4iMneEbHXlDmfhQaXH5f41cIYAFxk5pz59DdKYS4flcSRkSGKPqixs7pXUftvMtGS_fw.e
 TqKaSBKDcMM1y_94kJ9oOe7M1_zTg_Y6Fo4VY4J_v4qVJBZFJfwxAlHHeJ7PK5GtmC1ZiU7A4WUC
 v7Kk6o6TvYUGKCK18qxHDUqFTIKmbnJA0WMN5UaZF48Tn4fTWRcdKi.dRh5pTh38EG6VubRrQT0.
 eVTeDCFIKKLDPEVB3xJO40HE.0oGgq_0x5heE429_wuGH4gvi_G_QA.WKnf4Gg_1bJzhDyjUwsS9
 ratpIKv9eXzHRxGxcGSrZV2iP_mLl95UAVoowAjxQdIdB08BkaQjDfNv3Fj0r1LCk47_v_EQWc60
 6ZrLlDNnvJyV2yV.DCSnoAhsI7hP5QcsaKMqW9L88281RjM4KPjen0Gz1iACyQSVB6xmYKxLp3QT
 bksTSNrd5pK8Q_y75Rs_9i22VaYH3Ldpi1kuMgp9PbhU6ICuDnAJlSsucXGJ1.n1zfY3goD34D1I
 h8QDiDrOv07iLRMsGCv4StaPSYgrlJxW0oCiT6G7csiBSvmmjLc0vSj_dC.AuuKx8gMp1kzj1w1N
 NcAUAlZ0SUCo_ibcvsrWvnDni1A3IC4WY_Da7TeAHfaIoy0ffXxDtHWdu8dxDurrjeplyil35USX
 QCZptRZsdZkypK1iW39byMwnnumNcwF2p.EcoMdnG57Ui3eoG3P1IPCmRrUZDuCKVVJRwr5Moax7
 ssgtZGJP460TO_f4.mt00R1mkhu7x1S3QVuPyOZib_O3l8oLtU4liZXaEzpRAn72BRBSupYqQXzB
 rMIR5Z0u3Y2yV0Vu6_15DYQTfOkcKPtj8yfjh1yo_2ol2xMwfBl10GCdi6sM1VnVdh4I0fuK3iy0
 dcpYCkfmg8_hXWH3Jzg2iYIjDnQKYqoRauZSQ7WDvE7QxJjFmIxoTUgA15IgqI_TCPKd2uxk9pKl
 seYTwcQ2sTVXL9L4ri2rFRoC_NSfzW9ZIbo9bz6vqT8K70W3YckmbvH788kz1f9DTEb9AIWtR6fw
 E5ahswLveCkTAgKSBIvQKrf68RQYKiJII3IpshFH_DncpoYmMXiDXZVRZhrD0q1bA647MepVztjl
 _aqRMuJQKVAPs6bpsrKXRBIPzOIrpXkjWbB2Fne8pULLb7jFrvANFwv4W1pMDRxsalgnKdcspb95
 AurDRaj_Psg8szpQLleYIcJUrEYNYAm2sNXH.8cuOOU9_MD1PqWO8tQgikAA7JOPpqdAUFK5.EqF
 RZX3Vpr7WbL7mZgF0E5iynXVLiJKfGSqAGJt1NAP5OdpsnHR8M6Bw3J.FazdeuCGS0bMYFC8XCI.
 vrN9LhtM3bejJp_ZvumwbNkIr3Kh.ne45rRb59KWPsSr3Rn9VFGBhgDJZfb1dF_kaGnn3_ySNIiX
 8eMeur4ciyCfHu8EBoJ.YKtrFszhB1VprxdPuatKA.iYIoM__YR_TMJ7FXRPHqYurf2pZXug8FKX
 sghe3Va983IHu7ttNM6uygb1K7CxmPhJBc51ALcAMg.Ipg6tjli7LZtu7_jf.DypqADmCAxLZkRC
 5mFrEnx7keYfQUHPdawtVnj6HL6w4oQD6nlwrs8l3ANwUswHVo6lICb5dlvUKiG5vcrfOcaC1_Dy
 macnw3ofDp7qLTiWb_jHcrfqAjI8UAMkD2irbZF745n6JKeZHCWJrtwfUzysWGUYa5t0w4nuowkH
 VnGsnAWKku65PxXMkYpYaj41yfoWY5nvIpWKnhzh2chgFyoP1S12jQb8_kXg.Kedi7zW7gPy1G20
 QXQGrlyqnyF2rHYtQYZRuRQk9.omYvogbk6zfmxOsKzRk1nO4H3yUocQyES55zgf.nSaFtyzGMrr
 PW_WNmtMj6G0bcLTBscUD0st.G9kl7346q7.bVks4KCRV7dkeUIbNVxpnoZxj9EAJVmrkHmsvvg-
 -
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Sat, 19 Mar 2022 16:07:22 +0000
Received: by hermes--canary-production-bf1-665cdb9985-zm65g (VZM Hermes SMTP
 Server) with ESMTPA ID bd8d586da7e6832dcd6ba8030d16f89c; 
 Sat, 19 Mar 2022 16:07:20 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org,
	Wei Li <lw945lw945@yahoo.com>
Subject: [PATCH 0/2] cmpxchg and lock cmpxchg should not touch accumulator
Date: Sun, 20 Mar 2022 00:06:56 +0800
Message-Id: <20220319160658.336882-1-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20220319160658.336882-1-lw945lw945.ref@yahoo.com>
Received-SPF: pass client-ip=98.137.69.205; envelope-from=lw945lw945@yahoo.com;
 helo=sonic312-24.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 19 Mar 2022 12:53:45 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/508

This series fix a bug reported on issues 508.
The problem is cmpxchg and lock cmpxchg would touch accumulator when
they should not do that.

Wei Li (2):
  fix cmpxchg instruction
  fix lock cmpxchg instruction

 target/i386/tcg/translate.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

-- 
2.30.2


