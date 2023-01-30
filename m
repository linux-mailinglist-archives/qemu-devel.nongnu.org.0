Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC43680A4D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 11:02:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQyh-0005lI-S3; Mon, 30 Jan 2023 05:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nealelliott@netscape.net>)
 id 1pMQyV-0005kp-Gc
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:01:26 -0500
Received: from sonic316-8.consmr.mail.gq1.yahoo.com ([98.137.69.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nealelliott@netscape.net>)
 id 1pMQyT-0003U3-5o
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 05:01:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1675072872; bh=weIA/OPe9SQ9/fQDAocAuWOFcH1xfYbvsiKRDa2p9aI=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=VlODkKyNb0dVQUUkqXYH1Io8ezTRB8xLAEHtgB3nXmHsqRMgMsFVpe9PgLxidjYHIbQvfL4QJcQo4Mhc3Dc6KSkv9qL+Gb5SsFTEWlJOcWdD3+THztV/dMUuemADgleskPjdordhJSORLwsmAYJg8C7KAzIdcN8OxTKaJiOeBouYI6/DEMudu82k1inwPBZmmRPULeGzDI9Uk7JcYMtpc1RSOI/eFsI6zkzMbe0fGICwq70NFvbT47qYzz7WsYpN0+OxlD2g67oBVIAYbPIR2WewpN4sHfRldLk0YEZhdNuRuezh+e+IKpox7fTt0wkkvQJSMG+W5OpxEv500800nw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1675072872; bh=d6fuxWgaerZgy6TMoMZn6CstIvf8ovJGab0P/xk1sWE=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=ZkTd93IWducqSQ4vbtvDu5hREMctodTkcDspKsgFT55UD4qWJnYI/27Bmw42UJcny0za9nPDxi7iUV5Zu4L08HNPFgl+tQgNZq5GE5A5DDN47mj4ubb7ifsoJ+G4ShzjnAmaQAvVpQqJG82qo3slNjXr3XEKotL5xR96yQr485M86dDxlL7cU9BQRvfzQuH56t6lIHbmhH+OVpZBKsRAqTxjL8P7aqAKW6nEdgiPlHql5TdwxPwInsODas8TJIp04LA5PBWE2NkN+5ftkmrcKRbIwyjBpkmAO3a8j0MYxHXzv/WEx2lhk3uqirjj67PBDrw3730u1LdCHsn0aNCEVQ==
X-YMail-OSG: PVlayc4VM1kBo_jHFnFxlIlE68aRBNCKxNKGKFkhnV8MFHsG8S.nRMjAJAKV6pv
 gyAiFgGiNgTU7EzjeDgPMEg1DF_HTlNZ2dPht91SvRbnGNnt.jZ12YoTrCqk4bbh_DcLKHypfLnW
 LJJwb3f8.yknlOXaKgFUMF6YmtFzpgvt9rBjzMKiweCHDUuTOi726rwFBbph4jbydr8k37P5V9vs
 DxTFuVx7iLLDwI4rFohV5.NId0QmvELgW6Mdd5OfGfJKSFl0S0s9MN7R61snKAhFyQC4qP4qVXUR
 SxGq92HPdwfkyTb4pwyTB_llSfhePK3d8OJOYVuSBxSVz6jFB8V.UvArN6DFCODvni.f2xJBFdK6
 1fl6XSPPv16YUjMYZv1pjUdaaF9nUogXVV764aSTTtnp7fU3dsoQOec.tOqG97LC0e6WfdO64KuW
 lDNuvDl3yuCg_QkmEXQ5VukO5aL6DmiDs0h_4qnTQyLw0xd02qmqyfqYbeCj2OnMvWbsZpGrwK.i
 0v6smDjIlvIEup9G5Vg13RuysoDpClrEkVWyWfbMVS0hI2ggdunKWane4kPlDcGZ4QGNguLm9dsP
 JghgTL8WKdDMZmlyi541e11jao.8IXaQBh_LodCZPsyzuyR.hOwxJfj_Y5j2bOf4AqmW6eF3bk.j
 2WxWhoIDvndfdyOSOggLjycCUPrT1E2GzFpgoQj9_Mpr30mGLLsV1PYoKKVobpG8eD5JeyU0inr6
 u5DhqvIp3tcCDW7MjMY68rTtNVh1t7r54xZocw_Xq3O2bFVQAlSx54forDA1eXoUOOh0dq6uNwmJ
 wx0a913Wi4aG.MMsLvRkHqrSz9m39v1dzlUN6LhCG7Ns6Roxmk8i373uNMKISxmFzeKGl.3g9jyC
 6Wk4NUgwWoxxghkvTfFyHRyVrauWbSBO3SZi8smTfbBrwGu1Wpxln7SQC0g1q51f5s5B6xBIKz8P
 LC8jhYSFEIO9LzkzW2mt8hN.D4tj53ZUITM7_rURQA8SSeHhjQD.x7bHYUSfty16J4iltBODGwCF
 yH0lN29oOcb9CihG3gK7TRKvkC_c.oOuWH7JO9mlKuHvoS57VB87wtri8k1.29b1hrGkvtRDXIv8
 _RKPGWhOwcOiXhv3UAubBbzt06YMtzEhnyIKvbpJroZLmTpigeKffssdkkztmaq7pfK9l22q8PyL
 PhigIJHYLo7YRiHIdjuIM4y8MUP4ooRpdSRNDuQDDUKGplHUxRip5Cl_G3_FSZE6dOHCOpQFBR5B
 2Q7_rLbxy0iuVJRem6Fdy_1qJTEfOek8pynczIHsMVTJKnogH0w0G44d9_gTfQ..39OtiB1xZW3U
 zVBe4Dhx.vlcjGjiR3tP.BBJtsC1fDaMHKBv4rOxYn5r4K1guT8UOTZlJvnyu9dHYRcU4V8YQuGI
 36x4a5Uhl3t2RRtt7z2Q9bWccR8BqKBjAQW.LvoT_jcGqg3xZnDxA02YMkSsbwOK_2wVjGfhCS2H
 9pGr3tPDDRj9I_NjB_PSLIX0AzDjVCZbalzJyIb5Mklowu7c.kYexYE5Equvfm6ohwxg0c7rkxKo
 B2yj02Kg14RO8Qu0N78WSA9ytKBRNQ.vV8Bbx9WyD3U_W87HjO6Kp39jEHik7WMytuWh6rtXL_W_
 EOTEw3WHZBahfMegAzExlIKemWEZFSxJc3uZdaJa.Pp5Cie1D6TthFkU_Ev7.UUGrsNBZDJRTycO
 IV.j6cqJDFARllrzrX3v_CtEdPQnOLbNYd8298eDMgzGrqzbgEL0GVuwHP2rQO7ROIZLdFug8bLI
 Sjn0Z2ERLiXbOIXmBJSSRkKFG.tMofZWI1XVS6AyZc3x5IxJvFUxSLJokL3trn7GrAKJIsmJUtk8
 ujXlaFLST4KUiz1efEO6pQxnxCw_2LZKjdZAOn.G5mWlIF50TvmEE2KcLVJCl0lj5YRokKp0z30g
 gDfoZOpkyiZHlwG65xBbggFi5NnsRX3EeWC_72LkSPfreuCZ0pjOe7NhNX7CqrnUjisBjnDn2myq
 PxSyA8dO6V2DSj08_PrDIN.sFdpbelg1Ugf7APKFKHj8DjboxOSq4s.4i9rxF_i8N20f38gjjzm1
 Cmtosr7eRPUguvkmidV2WTg2ybmagmRoa5tyaMTEg1vC36LmO3xMDy3ZX3J6TPNe1cCtNmI9mR72
 Isxf7ng6XyrPE2348Bgf_vGodgNWktTC38cb_Vw--
X-Sonic-MF: <nealelliott@netscape.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Mon, 30 Jan 2023 10:01:12 +0000
Date: Mon, 30 Jan 2023 10:01:12 +0000 (UTC)
From: Neal Elliott <nealelliott@netscape.net>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <1614627941.1033038.1675072872015@mail.yahoo.com>
Subject: unable to use "-net user" argument after building from master branch
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1614627941.1033038.1675072872015.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.21123 AolMailNorrin
Received-SPF: pass client-ip=98.137.69.32;
 envelope-from=nealelliott@netscape.net;
 helo=sonic316-8.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

hello,=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I'm unable to use the "-net user"=
 argument with the compiled "qemu-system-x86_64" binary. I get an error: "q=
emu-system-x86_64: -net user: network backend 'user' is not compiled into t=
his binary"

I don't know what I'm missing when I used the configure script with the fol=
lowing arguments:

=C2=A0../configure --enable-linux-user --enable-user --enable-curses --enab=
le-vhost-net --enable-vhost-user --enable-png

what am I doing wrong? what other arguments do I need to add to allow the "=
-net user" option to work?

