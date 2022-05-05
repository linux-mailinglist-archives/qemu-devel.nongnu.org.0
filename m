Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEBF51BBA8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:14:12 +0200 (CEST)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXYp-0005iX-O3
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <internshipits2@gmail.com>)
 id 1nmXKu-0000U7-Si
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:59:49 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <internshipits2@gmail.com>)
 id 1nmXKs-0000Eu-Pp
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:59:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id q4so913807plr.11
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=3/4ECQgbf5dsch3JVcG9MAn0zlR1bsxA51LINdMAVXM=;
 b=cPwYuLCExiaA3NwDKHYa/o0t6/M2EddUz4zRVRxWro5eCpoj/inctNstpAduPEjgC6
 PIG1VGjmKYhSa67OCe0QpXiTysNOrpihbtNHCFz2mNwT9RzbEW0y3aNFdrE1+//6BPN0
 Jqtha/PAVfugFt88LWdlbLIh57sAU37PGVP7Zwr6c0pTOnyYv62rxclgqFzd/Y7aL85k
 nMgVr5BL6mPcVODCd9+7ulMz7oh8oBdkVx/KMd9+Wj/UmNQrrTEhM6P9OnUTQngSJyzO
 SvbVR+eFYt/9ky6fs1D3uhMb2sQRH51LJxueNaOKRvxL+Spf9CooNcinneV6kCS6OAPS
 PMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3/4ECQgbf5dsch3JVcG9MAn0zlR1bsxA51LINdMAVXM=;
 b=73AwIaPLTzFr/HokZoghG5QPmoI/t2OO7tOvid7fCnVLHlBJFyhDbEasX1UrEWWZ8b
 qyhHEf2Nb3H1SM0GXg/a9e4IzmD9PZtVYJuyQlyzhvRurUVPkMROrUfMHmC3yZRo7j+a
 xhhxgiOsybSLhN9DznO1XEZqzSafkuA1mOLsFFYc/3lgRfLRjsCnxi42vtA2XovD2Y3z
 XzUNfOSfmtBlC8y/6QGUAkPGfQE4LwG3d1E34wt70TPa9HIzSNlRjrcdMyvuvVhFXhc6
 3smvTtBCIElOzlxGh868K4Xorq5VhD0SYxemw9npfblq1YJ7vm+bTGZNrer4kBg5pcV9
 LteA==
X-Gm-Message-State: AOAM530BuDrF6B2D8p68k61Wmm/BzW9utNjDQYJCMfXsxr6Zzb5JCBDF
 U5qkc0toU2DItxyHVSP1bNGB+1gz0GVuwB2zrw+k0XX6T/EKBWi+
X-Google-Smtp-Source: ABdhPJwd80K9IYtpuqQCdBzLK77VhL230yl+FaUx6y9ivo20TSR642DtlfIHQydJ5ve13uJcGlzk5esjUfEe/9I1zCs=
X-Received: by 2002:a17:90b:1d0e:b0:1d2:79e9:21aa with SMTP id
 on14-20020a17090b1d0e00b001d279e921aamr4724713pjb.153.1651741184840; Thu, 05
 May 2022 01:59:44 -0700 (PDT)
MIME-Version: 1.0
From: "I. Its" <internshipits2@gmail.com>
Date: Thu, 5 May 2022 10:59:36 +0200
Message-ID: <CACvJYaMDT-9UguT1MSj24w3r8T_xOhjd=S76cZxL8WQJH6Grag@mail.gmail.com>
Subject: AMD SEV-SNP: Support for attestating initrd
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009559e705de3ff6d9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=internshipits2@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009559e705de3ff6d9
Content-Type: text/plain; charset="UTF-8"

Hi all,

we are currently working with SEV-SNP to include initrd in attestation
report. However, the function sev_add_kernel_loader_hashes() in
/qemu/target/i386/sev.c returns false when SEV-SNP is enabled:

if (sev_snp_enabled()) {
  return false;
}


Could someone elaborate on this topic and provide steps to support this
kind of attestation? Any hint is also very appreciated.

--0000000000009559e705de3ff6d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><br><div>we are currently working with S=
EV-SNP to include initrd in attestation report. However, the function sev_a=
dd_kernel_loader_hashes() in /qemu/target/i386/sev.c returns false when SEV=
-SNP is enabled:</div><div><br></div><div>
<pre class=3D"gmail-notranslate"><code class=3D"gmail-notranslate">if (sev_=
snp_enabled()) {
  return false;
}</code></pre>

</div><div><br>Could someone elaborate on this topic and provide steps to s=
upport this kind of attestation? Any hint is also very appreciated.<br></di=
v><div><br> </div></div>

--0000000000009559e705de3ff6d9--

