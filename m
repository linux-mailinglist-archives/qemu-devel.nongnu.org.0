Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29F920C893
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 16:51:07 +0200 (CEST)
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpYeA-0000Cc-Uq
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 10:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com>)
 id 1jpYdC-00088x-Q6
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 10:50:06 -0400
Received: from do158-143.mg.gitlab.com ([192.237.158.143]:54376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com>)
 id 1jpYdA-0008Ml-Gq
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 10:50:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.gitlab.com;
 q=dns/txt; 
 s=mailo; t=1593355803; h=List-Id: Content-Transfer-Encoding:
 Content-Type: Mime-Version: Subject: Message-ID: Reply-To: From: Date:
 Sender; bh=R5pFiF0z3Iiv2qXfO5qDShXpWrS1YpLS9ehriFze+ck=;
 b=Nsd820rJZ1RTkiVcF0vULrqPiiZSb8Y3CTa7T2TI9SROaUoIWzeGZ+Jj/+Mu355ew5par08R
 IQwu4/gj8XkCMjD9wht9m+XZ7ykp0PZJI27eQlk8qTwiNy469GxM4VqX9OUXtP4P0qf/UPPP
 3Ls7fjs3gdxSL8sfrYZCCfO/VA0=
X-Mailgun-Sending-Ip: 192.237.158.143
X-Mailgun-Sid: WyI3MWYzYSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOTQ3YjQiXQ==
Received: from mg.gitlab.com (65.90.74.34.bc.googleusercontent.com
 [34.74.90.65]) by smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5ef8ae1aa3d8a44743f53afa (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 28 Jun 2020 14:50:02 GMT
Date: Sun, 28 Jun 2020 14:50:02 +0000
Message-ID: <5ef8ae1a5af8b_1fc13fb06bc45a4461243@sidekiq-catchall-05-sv-gprd.mail>
Subject: QEMU | Pipeline #160886695 has failed for master | e7651153
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_5ef8ae1a52c5d_1fc13fb06bc45a44611a";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitLab-Project: QEMU
X-GitLab-Project-Id: 11167699
X-GitLab-Project-Path: qemu-project/qemu
X-GitLab-Pipeline-Id: 160886695
X-GitLab-Pipeline-Ref: master
X-GitLab-Pipeline-Status: failed
Auto-Submitted: auto-generated
X-Auto-Response-Suppress: All
Received-SPF: pass client-ip=192.237.158.143;
 envelope-from=bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com;
 helo=do158-143.mg.gitlab.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/28 10:50:02
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.01, RCVD_IN_MSPIKE_L5=2.5,
 REPLYTO_WITHOUT_TO_CC=1.552, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Reply-to: GitLab <noreply@gitlab.com>, GitLab <gitlab@mg.gitlab.com>
From: GitLab via <qemu-devel@nongnu.org>


----==_mimepart_5ef8ae1a52c5d_1fc13fb06bc45a44611a
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable



Your pipeline has failed.

Project: QEMU ( https://gitlab.com/qemu-project/qemu )
Branch: master ( https://gitlab.com/qemu-project/qemu/-/commits/master )

Commit: e7651153 ( https://gitlab.com/qemu-project/qemu/-/commit/e7651153=
a8801dad6805d450ea8bef9b46c1adf5 )
Commit Message: Merge remote-tracking branch 'remotes/amarkovic...
Commit Author: Peter Maydell ( https://gitlab.com/pm215 )

Pipeline #160886695 ( https://gitlab.com/qemu-project/qemu/-/pipelines/16=
0886695 ) triggered by Alex Benn=C3=A9e ( https://gitlab.com/stsquad )
had 2 failed builds.

Job #614631322 ( https://gitlab.com/qemu-project/qemu/-/jobs/614631322/ra=
w )

Stage: test
Name: build-disabled
Trace: qemu-system-i386: falling back to tcg
Could not access KVM kernel module: No such file or directory
qemu-system-i386: -accel kvm: failed to initialize kvm: No such file or d=
irectory
qemu-system-i386: falling back to tcg
Could not access KVM kernel module: No such file or directory
qemu-system-i386: -accel kvm: failed to initialize kvm: No such file or d=
irectory
qemu-system-i386: falling back to tcg
  TEST    check-qtest-i386: tests/qtest/device-introspect-test
  TEST    check-qtest-i386: tests/qtest/machine-none-test
  TEST    check-qtest-i386: tests/qtest/qmp-test
  TEST    check-qtest-i386: tests/qtest/qmp-cmd-test
  TEST    check-qtest-i386: tests/qtest/qom-test
  TEST    check-qtest-i386: tests/qtest/test-hmp
  TEST    check-qtest-i386: tests/qtest/qos-test
  TEST    check-qtest-mips64: tests/qtest/endianness-test
  TEST    check-qtest-mips64: tests/qtest/display-vga-test
  TEST    check-qtest-mips64: tests/qtest/cdrom-test
  TEST    check-qtest-mips64: tests/qtest/device-introspect-test
  TEST    check-qtest-mips64: tests/qtest/machine-none-test
  TEST    check-qtest-mips64: tests/qtest/qmp-test
  TEST    check-qtest-mips64: tests/qtest/qmp-cmd-test
  TEST    check-qtest-mips64: tests/qtest/qom-test
  TEST    check-qtest-mips64: tests/qtest/test-hmp
  TEST    check-qtest-mips64: tests/qtest/qos-test
  TEST    check-qtest-ppc64: tests/qtest/machine-none-test
  TEST    check-qtest-ppc64: tests/qtest/qmp-test
  TEST    check-qtest-ppc64: tests/qtest/qmp-cmd-test
  TEST    check-qtest-ppc64: tests/qtest/qom-test
section_end:1593355801:step_script
=1B[0K=1B[31;1mERROR: Job failed: execution took longer than 1h0m0s secon=
ds
=1B[0;m

Job #614631323 ( https://gitlab.com/qemu-project/qemu/-/jobs/614631323/ra=
w )

Stage: test
Name: build-tcg-disabled
Trace: 208      ...        [14:12:05]             ...              =

208      =1B[32mpass      =1B[0m [14:12:05] [14:12:06]   1s              =
 =

209      ...        [14:12:06]             ...              =

209      =1B[32mpass      =1B[0m [14:12:06] [14:12:06]   0s              =
 =

215      ...        [14:12:06]             ...              =

215      =1B[32mpass      =1B[0m [14:12:06] [14:13:34]  87s              =
 =

216      ...        [14:13:34]             ...              =

216      =1B[32mpass      =1B[0m [14:13:34] [14:13:38]   4s              =
 =

218      ...        [14:13:38]             ...              =

218      =1B[32mpass      =1B[0m [14:13:38] [14:13:40]   2s              =
 =

222      ...        [14:13:40]             ...              =

222      =1B[32mpass      =1B[0m [14:13:40] [14:13:41]   1s              =
 =

227      ...        [14:13:41]             ...              =

227      =1B[32mpass      =1B[0m [14:13:41] [14:13:41]   0s              =
 =

234      ...        [14:13:41]             ...              =

234      =1B[32mpass      =1B[0m [14:13:41] [14:13:42]   1s              =
 =

246      ...        [14:13:42]             ...              =

246      =1B[32mpass      =1B[0m [14:13:42] [14:13:43]   1s              =
 =

247      ...        [14:13:43]             ...              =

247      =1B[32mpass      =1B[0m [14:13:43] [14:13:44]   1s              =
 =

248      ...        [14:13:44]             ...              =

248      =1B[32mpass      =1B[0m [14:13:44] [14:13:44]   0s              =
 =

250      ...        [14:13:44]             ...              =

250      =1B[32mpass      =1B[0m [14:13:44] [14:13:45]   1s              =
 =

254      ...        [14:13:45]             ...              =

254      =1B[32mpass      =1B[0m [14:13:45] [14:13:45]   0s              =
 =

255      ...        [14:13:45]             ...              =

255      =1B[32mpass      =1B[0m [14:13:45] [14:13:47]   2s              =
 =

257      ...        [14:13:47]             ...              =

257      =1B[32mpass      =1B[0m [14:13:47] [14:13:58]  11s              =
 =

258      ...        [14:13:58]             ...              =

258      =1B[32mpass      =1B[0m [14:13:58] [14:13:58]   0s              =
 =

260      ...        [14:13:58]             ...              =

260      =1B[32mpass      =1B[0m [14:13:58] [14:13:59]   1s              =
 =

261      ...        [14:13:59]             ...              =

261      =1B[32mpass      =1B[0m [14:13:59] [14:14:25]  26s              =
 =

262      ...        [14:14:25]             ...              =

262      =1B[32mpass      =1B[0m [14:14:25] [14:14:25]   0s              =
 =

263      ...        [14:14:26]             ...              =

263      =1B[32mpass      =1B[0m [14:14:26] [14:14:28]   2s              =
 =

264      ...        [14:14:28]             ...              =

264      =1B[32mpass      =1B[0m [14:14:28] [14:14:32]   4s              =
 =

270      ...        [14:14:32]             ...              =

270      =1B[32mpass      =1B[0m [14:14:32] [14:14:34]   2s              =
 =

272      ...        [14:14:34]             ...              =

272      =1B[32mpass      =1B[0m [14:14:34] [14:14:35]   1s              =
 =

273      ...        [14:14:35]             ...              =

273      =1B[32mpass      =1B[0m [14:14:35] [14:14:35]   0s              =
 =

277      ...        [14:14:35]             ...              =

277      =1B[32mpass      =1B[0m [14:14:35] [14:14:36]   1s              =
 =

279      ...        [14:14:36]             ...              =

279      =1B[32mpass      =1B[0m [14:14:36] [14:14:36]   0s              =
 =

Failures: 051
Failed 1 of 57 iotests
section_end:1593353691:step_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m


-- =

You're receiving this email because of your account on gitlab.com.




----==_mimepart_5ef8ae1a52c5d_1fc13fb06bc45a44611a
Content-Type: text/html;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://ww=
w.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=3D"http://www.w3.org/1999/xhtml" lang=3D"en" xml:lang=3D"en">=

<head>
<meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Type" =
/>
<meta content=3D"width=3Ddevice-width, initial-scale=3D1" name=3D"viewpor=
t" />
<meta content=3D"IE=3Dedge" http-equiv=3D"X-UA-Compatible" />
<title>QEMU | Pipeline #160886695 has failed for master | e7651153</title=
>
<style data-premailer=3D"ignore" type=3D"text/css">
body,table,td,a{-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}t=
able,td{mso-table-lspace:0pt;mso-table-rspace:0pt}img{-ms-interpolation-m=
ode:bicubic}.hidden{display:none !important;visibility:hidden !important}=
a[x-apple-data-detectors]{color:inherit !important;text-decoration:none !=
important;font-size:inherit !important;font-family:inherit !important;fon=
t-weight:inherit !important;line-height:inherit !important}div[style*=3D'=
margin: 16px 0']{margin:0 !important}@media only screen and (max-width: 6=
39px){body,#body{min-width:320px !important}table.wrapper{width:100% !imp=
ortant;min-width:320px !important}table.wrapper td.wrapper-cell{border-le=
ft:0 !important;border-right:0 !important;border-radius:0 !important;padd=
ing-left:10px !important;padding-right:10px !important}}

</style>

<style>body {
margin: 0 !important; background-color: #fafafa; padding: 0; text-align: =
center; min-width: 640px; width: 100%; height: 100%; font-family: "Helvet=
ica Neue", Helvetica, Arial, sans-serif;
}
</style></head>
<body style=3D"text-align: center; min-width: 640px; width: 100%; height:=
 100%; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-se=
rif; margin: 0; padding: 0;" bgcolor=3D"#fafafa">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" id=3D"body" style=
=3D"text-align: center; min-width: 640px; width: 100%; margin: 0; padding=
: 0;" bgcolor=3D"#fafafa">
<tbody>
<tr class=3D"line">
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif; height: 4px; font-size: 4px; line-height: 4px;" bgcolor=3D"#6b=
4fbb"></td>
</tr>
<tr class=3D"header">
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif; font-size: 13px; line-height: 1.6; color: #5c5c5c; padding: 25=
px 0;">

<img alt=3D"GitLab" src=3D"https://gitlab.com/assets/mailers/gitlab_heade=
r_logo-153749eaa7ea6fafcb995161abd3247bc4c4500f31498b0c4024f50093983ac0.g=
if" width=3D"55" height=3D"50" />
</td>
</tr>
<tr>
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"wrapper"=
 style=3D"width: 640px; border-collapse: separate; border-spacing: 0; mar=
gin: 0 auto;">
<tbody>
<tr>
<td class=3D"wrapper-cell" style=3D"font-family: &quot;Helvetica Neue&quo=
t;, Helvetica, Arial, sans-serif; border-radius: 3px; overflow: hidden; p=
adding: 18px 25px; border: 1px solid #ededed;" align=3D"left" bgcolor=3D"=
#ffffff">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"content"=
 style=3D"width: 100%; border-collapse: separate; border-spacing: 0;">
<tbody>
<tr class=3D"alert">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; bo=
rder-radius: 3px; font-size: 14px; line-height: 1.3; overflow: hidden; co=
lor: #ffffff; padding: 10px;" align=3D"center" bgcolor=3D"#d22f57">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse; margin: 0 auto;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #ffffff; padding-right: 5px; line-height: 1;" align=3D"center" valig=
n=3D"middle">
<img alt=3D"&#10006;" height=3D"13" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-inverted-06edddd39ba2a7f9a32f6201e420=
175db85a4b6ac0348203fdc069001b440149.gif" style=3D"display: block;" width=
=3D"13" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #ffffff;" align=3D"center" valign=3D"middle">
Your pipeline has failed.
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr class=3D"spacer">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; he=
ight: 18px; font-size: 18px; line-height: 18px;">
&#160;
</td>
</tr>
<tr class=3D"section">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; bo=
rder-radius: 3px; overflow: hidden; padding: 0 15px; border: 1px solid #e=
deded;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"table-in=
fo" style=3D"width: 100%;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; margin=
: 0; padding: 14px 0;">Project</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 500; color: #333333; width:=
 75%; margin: 0; padding: 14px 0 14px 5px;">
<a class=3D"muted" href=3D"https://gitlab.com/qemu-project" style=3D"colo=
r: #333333; text-decoration: none;">
QEMU
</a>
/
<a class=3D"muted" href=3D"https://gitlab.com/qemu-project/qemu" style=3D=
"color: #333333; text-decoration: none;">
QEMU
</a>
</td>
</tr>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; border=
-top-width: 1px; border-top-color: #ededed; border-top-style: solid; marg=
in: 0; padding: 14px 0;">Branch</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 500; color: #333333; width:=
 75%; border-top-width: 1px; border-top-color: #ededed; border-top-style:=
 solid; margin: 0; padding: 14px 0 14px 5px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px;" valign=3D"middle">
<img alt=3D"" height=3D"13" src=3D"https://gitlab.com/assets/mailers/ci_p=
ipeline_notif_v1/icon-branch-gray-53618a7fc19d4d32ccbabac2f6d59bebe67202a=
9f2f1255e3f72c69756c0dd9c.gif" style=3D"display: block;" width=3D"13" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"middle">
<a class=3D"muted" href=3D"https://gitlab.com/qemu-project/qemu/-/commits=
/master" style=3D"color: #333333; text-decoration: none;">
master
</a>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; border=
-top-width: 1px; border-top-color: #ededed; border-top-style: solid; marg=
in: 0; padding: 14px 0;">Commit</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 400; color: #333333; width:=
 75%; border-top-width: 1px; border-top-color: #ededed; border-top-style:=
 solid; margin: 0; padding: 14px 0 14px 5px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px;" valign=3D"middle">
<img alt=3D"" height=3D"13" src=3D"https://gitlab.com/assets/mailers/ci_p=
ipeline_notif_v1/icon-commit-gray-c10243ac24cde64b549aec91de35e6b49c8739b=
506b86472b54614c10d8b4aac.gif" style=3D"display: block;" width=3D"13" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"middle">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/e7651153a8801dad=
6805d450ea8bef9b46c1adf5" style=3D"color: #3777b0; text-decoration: none;=
">
e7651153
</a>
</td>
</tr>
</tbody>
</table>
<div class=3D"commit" style=3D"color: #5c5c5c; font-weight: 300;">
Merge remote-tracking branch 'remotes/amarkovic...
</div>
</td>
</tr>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; color: #8c8c8c; font-weight: 300; border=
-top-width: 1px; border-top-color: #ededed; border-top-style: solid; marg=
in: 0; padding: 14px 0;">Commit Author</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; font-weight: 500; color: #333333; width:=
 75%; border-top-width: 1px; border-top-color: #ededed; border-top-style:=
 solid; margin: 0; padding: 14px 0 14px 5px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px;" valign=3D"middle">
<img alt=3D"" class=3D"avatar" height=3D"24" src=3D"https://secure.gravat=
ar.com/avatar/98261ce19b4e9da714d577154686723a?s=3D48&amp;d=3Didenticon" =
style=3D"display: block; border-radius: 12px; margin: -2px 0;" width=3D"2=
4" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4;" valign=3D"middle">
<a class=3D"muted" href=3D"https://gitlab.com/pm215" style=3D"color: #333=
333; text-decoration: none;">
Peter Maydell
</a>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr class=3D"spacer">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; he=
ight: 18px; font-size: 18px; line-height: 18px;">
&#160;
</td>
</tr>
<tr class=3D"pre-section">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #333333; font-size: 15px; font-weight: 400; line-height: 1.4; paddin=
g: 15px 5px 0;" align=3D"center">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse; margin: 0 auto;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; font-weight: 500; line-height: 1.4;" valign=3D"baseline">
Pipeline
<a href=3D"https://gitlab.com/qemu-project/qemu/-/pipelines/160886695" st=
yle=3D"color: #3777b0; text-decoration: none;">
#160886695
</a>
triggered by
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; line-height: 1.4; padding-right: 5px; padding-left: 5px;" =
width=3D"24" valign=3D"middle">
<img alt=3D"" class=3D"avatar" height=3D"24" src=3D"https://secure.gravat=
ar.com/avatar/a7d7f408c0b3370bbbeb98833d6c50e4?s=3D48&amp;d=3Didenticon" =
style=3D"display: block; border-radius: 12px; margin: -2px 0;" width=3D"2=
4" />
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; fo=
nt-size: 15px; font-weight: 500; line-height: 1.4;" valign=3D"baseline">
<a class=3D"muted" href=3D"https://gitlab.com/stsquad" style=3D"color: #3=
33333; text-decoration: none;">
Alex Benn&#233;e
</a>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; color: #333333; font-size: 14px; font-weight: 400; line-heigh=
t: 1.4; padding: 0 8px 16px;" align=3D"center">
had
2
failed
builds.
</td>
</tr>
<tr class=3D"table-warning">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; bo=
rder-radius: 4px 4px 0 0; overflow: hidden; color: #d22852; font-size: 14=
px; line-height: 1.4; padding: 8px 16px; border-color: #ededed; border-st=
yle: solid; border-width: 1px 1px 0;" align=3D"center" bgcolor=3D"#fdf4f6=
">
Logs may contain sensitive data. Please consider before forwarding this e=
mail.
</td>
</tr>
<tr class=3D"section">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; ov=
erflow: hidden; border-radius: 0 0 4px 4px; padding: 0 16px; border-color=
: #ededed; border-style: solid; border-width: 0 1px 1px;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"builds" =
style=3D"width: 100%; border-collapse: collapse;">
<tbody>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
test
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/614631322" style=3D=
"color: #3777b0; text-decoration: none;">
build-disabled
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>qemu-syst=
em-i386: falling back to tcg<br />Could not access KVM kernel module: No =
such file or directory<br />qemu-system-i386: -accel kvm: failed to initi=
alize kvm: No such file or directory<br />qemu-system-i386: falling back =
to tcg<br />Could not access KVM kernel module: No such file or directory=
<br />qemu-system-i386: -accel kvm: failed to initialize kvm: No such fil=
e or directory<br />qemu-system-i386: falling back to tcg<br />  TEST    =
check-qtest-i386: tests/qtest/device-introspect-test<br />  TEST    check=
-qtest-i386: tests/qtest/machine-none-test<br />  TEST    check-qtest-i38=
6: tests/qtest/qmp-test<br />  TEST    check-qtest-i386: tests/qtest/qmp-=
cmd-test<br />  TEST    check-qtest-i386: tests/qtest/qom-test<br />  TES=
T    check-qtest-i386: tests/qtest/test-hmp<br />  TEST    check-qtest-i3=
86: tests/qtest/qos-test<br />  TEST    check-qtest-mips64: tests/qtest/e=
ndianness-test<br />  TEST    check-qtest-mips64: tests/qtest/display-vga=
-test<br />  TEST    check-qtest-mips64: tests/qtest/cdrom-test<br />  TE=
ST    check-qtest-mips64: tests/qtest/device-introspect-test<br />  TEST =
   check-qtest-mips64: tests/qtest/machine-none-test<br />  TEST    check=
-qtest-mips64: tests/qtest/qmp-test<br />  TEST    check-qtest-mips64: te=
sts/qtest/qmp-cmd-test<br />  TEST    check-qtest-mips64: tests/qtest/qom=
-test<br />  TEST    check-qtest-mips64: tests/qtest/test-hmp<br />  TEST=
    check-qtest-mips64: tests/qtest/qos-test<br />  TEST    check-qtest-p=
pc64: tests/qtest/machine-none-test<br />  TEST    check-qtest-ppc64: tes=
ts/qtest/qmp-test<br />  TEST    check-qtest-ppc64: tests/qtest/qmp-cmd-t=
est<br />  TEST    check-qtest-ppc64: tests/qtest/qom-test<br /></span><s=
pan class=3D"term-fg-l-red term-bold">ERROR: Job failed: execution took l=
onger than 1h0m0s seconds<br /></span></pre>
</td>
</tr>
<tr class=3D"build-state">
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px; padding: 16px 0;">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"img" sty=
le=3D"border-collapse: collapse;">
<tbody>
<tr>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #d22f57; font-weight: 500; font-size: 16px; padding-right: 8px; line=
-height: 10px;" valign=3D"middle">
<img alt=3D"&#10006;" height=3D"10" src=3D"https://gitlab.com/assets/mail=
ers/ci_pipeline_notif_v1/icon-x-red-67056b7b99899e30453df79abfbe16162f6a2=
6ed789d8236f81afcaea216ffe6.gif" style=3D"display: block;" width=3D"10" /=
>
</td>
<td style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; co=
lor: #8c8c8c; font-weight: 500; font-size: 14px;" valign=3D"middle">
test
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/614631323" style=3D=
"color: #3777b0; text-decoration: none;">
build-tcg-disabled
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>208      =
...        [14:12:05]             ...              =

208      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:12:05] [14:12:06]   1s               <br />209      ...        [14:12:06=
]             ...              =

209      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:12:06] [14:12:06]   0s               <br />215      ...        [14:12:06=
]             ...              =

215      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:12:06] [14:13:34]  87s               <br />216      ...        [14:13:34=
]             ...              =

216      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:34] [14:13:38]   4s               <br />218      ...        [14:13:38=
]             ...              =

218      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:38] [14:13:40]   2s               <br />222      ...        [14:13:40=
]             ...              =

222      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:40] [14:13:41]   1s               <br />227      ...        [14:13:41=
]             ...              =

227      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:41] [14:13:41]   0s               <br />234      ...        [14:13:41=
]             ...              =

234      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:41] [14:13:42]   1s               <br />246      ...        [14:13:42=
]             ...              =

246      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:42] [14:13:43]   1s               <br />247      ...        [14:13:43=
]             ...              =

247      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:43] [14:13:44]   1s               <br />248      ...        [14:13:44=
]             ...              =

248      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:44] [14:13:44]   0s               <br />250      ...        [14:13:44=
]             ...              =

250      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:44] [14:13:45]   1s               <br />254      ...        [14:13:45=
]             ...              =

254      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:45] [14:13:45]   0s               <br />255      ...        [14:13:45=
]             ...              =

255      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:45] [14:13:47]   2s               <br />257      ...        [14:13:47=
]             ...              =

257      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:47] [14:13:58]  11s               <br />258      ...        [14:13:58=
]             ...              =

258      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:58] [14:13:58]   0s               <br />260      ...        [14:13:58=
]             ...              =

260      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:58] [14:13:59]   1s               <br />261      ...        [14:13:59=
]             ...              =

261      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:13:59] [14:14:25]  26s               <br />262      ...        [14:14:25=
]             ...              =

262      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:14:25] [14:14:25]   0s               <br />263      ...        [14:14:26=
]             ...              =

263      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:14:26] [14:14:28]   2s               <br />264      ...        [14:14:28=
]             ...              =

264      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:14:28] [14:14:32]   4s               <br />270      ...        [14:14:32=
]             ...              =

270      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:14:32] [14:14:34]   2s               <br />272      ...        [14:14:34=
]             ...              =

272      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:14:34] [14:14:35]   1s               <br />273      ...        [14:14:35=
]             ...              =

273      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:14:35] [14:14:35]   0s               <br />277      ...        [14:14:35=
]             ...              =

277      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:14:35] [14:14:36]   1s               <br />279      ...        [14:14:36=
]             ...              =

279      </span><span class=3D"term-fg-green">pass      </span><span> [14=
:14:36] [14:14:36]   0s               <br />Failures: 051<br />Failed 1 o=
f 57 iotests<br /></span><span class=3D"term-fg-l-red term-bold">ERROR: J=
ob failed: exit code 1<br /></span></pre>
</td>
</tr>
</tbody>
</table>
</td>
</tr>


</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>

<tr class=3D"footer">
<td style=3D"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, s=
ans-serif; font-size: 13px; line-height: 1.6; color: #5c5c5c; padding: 25=
px 0;">
<img alt=3D"GitLab" height=3D"33" src=3D"https://gitlab.com/assets/mailer=
s/gitlab_footer_logo-078860f148cc9596195e6bb3fa7db31c30538355576c5c3b569c=
414902e3d095.gif" width=3D"90" style=3D"display: block; margin: 0 auto 1e=
m;" />
<div>
You're receiving this email because of your account on gitlab.com. <a cla=
ss=3D"mng-notif-link" href=3D"https://gitlab.com/profile/notifications" s=
tyle=3D"color: #3777b0; text-decoration: none;">Manage all notifications<=
/a> &#183; <a class=3D"help-link" href=3D"https://gitlab.com/help" style=3D=
"color: #3777b0; text-decoration: none;">Help</a>
</div>
</td>
</tr>

<tr>
<td class=3D"footer-message" style=3D"font-family: &quot;Helvetica Neue&q=
uot;, Helvetica, Arial, sans-serif; font-size: 13px; line-height: 1.6; co=
lor: #5c5c5c; padding: 25px 0;">

</td>
</tr>
</tbody>
</table>
</body>
</html>

----==_mimepart_5ef8ae1a52c5d_1fc13fb06bc45a44611a--

