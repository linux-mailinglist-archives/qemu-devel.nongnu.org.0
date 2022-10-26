Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A7660DB98
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 08:51:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onaCf-00042w-KX; Wed, 26 Oct 2022 02:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1onaCS-0002aC-Io
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 02:47:41 -0400
Received: from sonic306-19.consmr.mail.gq1.yahoo.com ([98.137.68.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1onaCO-00038K-Ut
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 02:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1666766848; bh=dLXrJkyiqsIYSywqKcL7l1Em1BNR45sfHEGx1oxqiGw=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=Lyg5OZaRttFnGNg/8bmNuJi3/0BI1FSHLxUoy212k4uVw3EMytYYX57pmxmjxb04ra8TQejVv2wVVgeAvZieBPtNADbv/cjV67Lqt9cYvIkr6V5y2yoAujMVwKZ/8yYCENFTSmsFEfYv0Ko8zbhdpFnOzd4SclsfQC6bvlRsWb0nOE0GBLvB6DMHbngGrpO3cqIlQJTatFUlcTtStWcV7nOCUUi+8/MMSmRS9gBl6PvKu2GjR0jWGafiVRAhwvOTw9JAhUi714GRG8FPg1g/ZEvLlc6N0IT+TQSYB9HbkqvCyEhOizIAIyX1QkUJNDF3xnGkKbpgZefMEnbtoY8Szg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666766848; bh=DZIOPkXCbwnwejG//h5zhhHCiMPr/e0DijlWUSFDkh3=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=HKaO0RPdCtti4skngDL5fhvvVcDLQMZ77m2sz1dbeVifY3PsboP6fWWqKEEs8jhh1Xo8viylKmlYeO6YE4sTMpsHfc5MoVnF6TarASEXxvWELxmwft8SkCKMqJQWM01TWlBMpxGED+2jBJxaneIm8uxm4/A2H3Uwq8moICJgfewZlemVaP1ZTeeaor32fzddfb8XlI9TInFz2lMKVbxiiRN/J4r7KwrxKSDhw1+foPyxR86Q1ZREq+F+8K0zU3y4Twdc4kuxEYjezejhjiVUuREGDCPwVvrs36Ypy8yA6zJNZbaGnjPyuPbAizGUXTIcxIEfk8EfeC4Al+8CeA6HlA==
X-YMail-OSG: _iZutSEVM1k_8REuJyjNnB1PBvx8Y_BrUcP9ZE0sP6dy2yhL_on2SJVSbFHHzHt
 vuvFelI9Inu5a6iJFouc.OA6JsFTVJn6dQIpxjFC16qcJPgpqbzXnFW8my5ka8BhqlQ.nIBSZTvx
 su0B7mgyMyEkFU1wPbN3rFBMzN3XBs2WOP8oPuL9.1BySJk_C4lCCMKAwIEJxIpJzMuHhus8_tJ4
 l3RGCNoaP_OTxpyNCR4TrBCgU1tAyf.wjnOa32SlivgflXX.lTJASKpESynFtW6Q7pw2GCxQDJub
 oMpF1cqrDM5gJL89nlnJisbE_TauLvpLkn1f1Tlh_Lz10hOYKbNjNWbI8v5uUyClAkQwQ7wOCFMZ
 McBw7rFHgkrdcSW8xqqNS8IwEIt.UZodj_urta9rRJ77RY93UXsv3WuSZj8W059kReesOoCl.fei
 qEcnfLoV5cUVMqmuka0djhbasIIMtqFwKSx6pfpTF0U781aDBR9pqfOFlgC8PnCNnc3zAajM6Cr9
 lguStnZNLsEgHXzCtj9IAsCVpO3kynErllBccdB9z4Vinx5sycllTAGBcm4h0Fomkus27N5jLUeM
 l3ih0i9JLpz2PDH8m92h6qrrPJYSkNNOiTCJdQLwK3beNG.sM7K3qw027OJaMxg5N_8hH3X4JvMd
 JMSjR_y2I5kzvQ5g__Fw29.M2OCQAYkftaW9eFsqLZxYK6N1m_nyO5nKQVaAvZlAcXtLitAMepFr
 MDlnprWVBYASLdKunhM_h95SkH9iU9gmmancQNu70ATknBuek_qfZvV6eScZqIFi5134u_0yZL7E
 uaiJ_9M9w4UnLj8pHq79pDKRNU8p6UwxuQ.QZ3qhc5fT54r_aDt6jdgdGIgfPX4BGRjg1g8JfKKJ
 vW0comVOnqq.eWM.H1EHq7WXeMILh9aI1FZHI5SpC_onsz6wT7K4C6cEQ.vFI8W.A13B9vpoW64a
 DL5fk3uFe5TnHtRDf5ktC3XpqNpqa4YLjIIEk8vlrriXp2gptiBnMgZkh8OIxJbWkyERes24SPOg
 IBq2QNhvBgxfNKelqONpLjs0wiPmFTmXpfdtN.z_uUybmIDzCiACjST5r4YKsVYOWmOrIsadTOFl
 zlr6tSnp5BQy84jRkWGm2eJr6YklzXnQ4_4amYgBhb_0o0Gw8qHjDW3pXO8mAWnjGw5fhCLUk3wn
 96xr5PrFx7mmK5Wc_cvBamTJ3BkkfNV7NLla9dTc40FnrX6cytJ0z3aGWV.H0Lnkuuvbscnhmtwt
 Cl4_IvzkYx.7V6cd8.cQA73D5ETtJubBAAEPeluARv.SqfJyc_1qtkHUdi62bgbtj_CiGLXi4QJ6
 FIUr8W.wF3qwCS4ckTteYPWXJ0NNnMPv4LW1riaxftxwFUOlfrpbSHwFfCRKoaMEqsCYlUnyaTJI
 m4Y5k9eDtdxQGWFxuloohedP.J7Gc0gy8AXXs4..cBGSYtCHC4VacJWrxuUcpkW2XBDpBjNuT6OC
 MTXzUShiV0L2E_mcvBkkXaxsafkmUHWVYtGKbiAjWR4uZjRI.pULSHoLb9iYTx1DEeJSWI2dsheA
 H_mU0lymNGXoCvXExwZyBIevxkl.q9_pEG261PqvXI2MwJSczCuSF4r7CjBhdVB087yJG.v0dAYU
 wUfAneAiqlpj.eSl29a4q0ye93L3wMzQz3XbwzLA5JK_57tRw2KefSiJzIEXflaDDB_GDDH7QooY
 C1md3WKuhQPi.sOva3Yj0ELU6NXGrTEfhB_gD9SCGwa8QRhy0PKi5BJotXQzlzhuiFDwtSW9f2jZ
 DxwOViF1QL8ckvYVtuUqXoyEJ76QsHqdNDy2PdQx.YINd6Tl_1Z63PAxPkiZvqnpe8_1jNMd2WUe
 8v2HRz12dCDS0r.GweCr5T3vZnX9ax.SowAwfbOoOIBqkXlCnVCRKQGHFi_T9ZiVOcQrhhpZFi9k
 EnfNsSZkZzT9yiuo0PSYQN6g.8FKhVB0QjXzV1uUzDq2ssqie78uHKSGw6Zr_PTbt9aP4pOF7.2I
 K6R3_tmvmc.9Gxmstdifu82pepzxTqEZQ.6UP5GTcal5MytbsV2SWUntuPTQFJzRFj9xl25JcX59
 8ErYxWl3aZKntC_F0rXnKV5ZxcdvBsdP4mr4NS_iSwanhhAkob9IbjaTVNjTey6P0gXDFXt5MEQ0
 pLbFMTKAEfm7elaw_BMLeEFTz2zCjv3LVKeaNay0P0sZtnsRrnWQMiEs9.ON1N7Rr3WY8M8Klf_c
 x
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 06:47:28 +0000
Received: by hermes--production-ne1-c47ffd5f5-kmjmv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 636de0ff1881defd5f865b248e2c93fc; 
 Wed, 26 Oct 2022 06:47:26 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Chuck Zmudzinski <brchuckz@netscape.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] xen/pt: fix FTBFS and reserve PCI slot 2 for the Intel IGD
Date: Wed, 26 Oct 2022 02:47:06 -0400
Message-Id: <cover.1666764146.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1666764146.git.brchuckz.ref@netscape.net>
Received-SPF: pass client-ip=98.137.68.82; envelope-from=brchuckz@aim.com;
 helo=sonic306-19.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Chuck Zmudzinski <brchuckz@netscape.net>

This is a series of two patches:

The first fixes FTBFS when --enable-xen and --disable-xen-pci-passthrough
configure options are set with when building for the linux target os.

The second fixes a regression that was introduced many years ago with the
upgrade from the Qemu traditional device model that is still available
from xenbits.xen.org and based on very old Qemu version 0.10.2.

The regression is that the Qemu traditional device model reserves slot 2
for the Intel IGD on the PCI bus when the Intel IGD is passed through
to a Xen HVM domain, but the current Qemu upsream device model does not
and in fact results in a different slot assigned to the Intel IGD.

This behavior does not conform to the requirement that the Intel IGD must
be assigned to slot 2, as noted in docs/igd-assign.txt in the Qemu source
code: "IGD must be given address 02.0 on the PCI root bus in the VM."

I have used the second patch of the series for the past two years with
no problems. Without the patch, the reliability of PCI passthrough of the
Intel IGD to a Xen HVM guest is very poor, and in some cases the guest
fails to start without the patch.

Chuck Zmudzinski (2):
  xen/pt: fix syntax error that causes FTBFS in some configurations
  xen/pt: reserve PCI slot 2 for Intel igd-passthru

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/meson.build   |  2 +-
 hw/xen/xen_pt.c      | 25 +++++++++++++++++++++++++
 hw/xen/xen_pt.h      | 16 ++++++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 5 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.37.2


