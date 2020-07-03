Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D3D213F28
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 20:04:27 +0200 (CEST)
Received: from localhost ([::1]:40394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrQ30-00062T-IO
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 14:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com>)
 id 1jrQ1B-00055e-Vu
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 14:02:34 -0400
Received: from do158-143.mg.gitlab.com ([192.237.158.143]:64914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com>)
 id 1jrQ15-0005C1-Et
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 14:02:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.gitlab.com;
 q=dns/txt; 
 s=mailo; t=1593799351; h=List-Id: Content-Transfer-Encoding:
 Content-Type: Mime-Version: Subject: Message-ID: Reply-To: From: Date:
 Sender; bh=vkdNq3N1kIzaVE0fxOgQhN7dlN0aytIhN8SAW1QSVlw=;
 b=HA+IYPiRMH73ihRKhDegEoLNRk2k5XHl7bJhyTnMweqQ3BIR0oSWWA1fSrkd2QaKocK1O2na
 9j6wglruuhxx+fyQBV1mfD34seihQlB7fGihN4dGwFpxrqPqMzQIn51Xh+U7pACbw2v6nYlw
 GrN1YBc6biy/9Z6fHMmHenG47ho=
X-Mailgun-Sending-Ip: 192.237.158.143
X-Mailgun-Sid: WyI3MWYzYSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOTQ3YjQiXQ==
Received: from mg.gitlab.com (69.90.74.34.bc.googleusercontent.com
 [34.74.90.69]) by smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5eff7294f3deea03f3e17763 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 03 Jul 2020 18:01:56 GMT
Date: Fri, 03 Jul 2020 18:01:55 +0000
Message-ID: <5eff72933586f_36b33fb44495431c74373@sidekiq-catchall-06-sv-gprd.mail>
Subject: QEMU | Pipeline #162951134 has failed for master | 5f42c337
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_5eff72932f1a3_36b33fb44495431c74218";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitLab-Project: QEMU
X-GitLab-Project-Id: 11167699
X-GitLab-Project-Path: qemu-project/qemu
X-GitLab-Pipeline-Id: 162951134
X-GitLab-Pipeline-Ref: master
X-GitLab-Pipeline-Status: failed
Auto-Submitted: auto-generated
X-Auto-Response-Suppress: All
Received-SPF: pass client-ip=192.237.158.143;
 envelope-from=bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com;
 helo=do158-143.mg.gitlab.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 03:09:38
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.01, RCVD_IN_MSPIKE_L4=1.7,
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


----==_mimepart_5eff72932f1a3_36b33fb44495431c74218
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable



Your pipeline has failed.

Project: QEMU ( https://gitlab.com/qemu-project/qemu )
Branch: master ( https://gitlab.com/qemu-project/qemu/-/commits/master )

Commit: 5f42c337 ( https://gitlab.com/qemu-project/qemu/-/commit/5f42c337=
5d45108cf14f50ac8ba57c2865e75e9c )
Commit Message: Merge remote-tracking branch 'remotes/alistair/...
Commit Author: Peter Maydell ( https://gitlab.com/pm215 )

Pipeline #162951134 ( https://gitlab.com/qemu-project/qemu/-/pipelines/16=
2951134 ) triggered by Alex Benn=C3=A9e ( https://gitlab.com/stsquad )
had 1 failed build.

Job #623454255 ( https://gitlab.com/qemu-project/qemu/-/jobs/623454255/ra=
w )

Stage: test
Name: build-disabled
Trace: =1B[0KRunning with gitlab-runner 13.1.0 (6214287e)
=1B[0;m=1B[0K  on docker-auto-scale 72989761
=1B[0;msection_start:1593796383:prepare_executor
=1B[0K=1B[0K=1B[36;1mPreparing the "docker+machine" executor=1B[0;m
=1B[0;m=1B[0KUsing Docker executor with image fedora:latest ...
=1B[0;m=1B[0KPulling docker image fedora:latest ...
=1B[0;m=1B[0KUsing docker image sha256:adfbfa4a115a799771d3060d0aa213584c=
91e549187da4fb0036240294ca4a8f for fedora:latest ...
=1B[0;msection_end:1593796394:prepare_executor
=1B[0Ksection_start:1593796394:prepare_script
=1B[0K=1B[0K=1B[36;1mPreparing environment=1B[0;m
=1B[0;mRunning on runner-72989761-project-11167699-concurrent-0 via runne=
r-72989761-srm-1593796296-233333bb...
section_end:1593796397:prepare_script
=1B[0Ksection_start:1593796397:get_sources
=1B[0K=1B[0K=1B[36;1mGetting source from Git repository=1B[0;m
=1B[0;m=1B[32;1m$ eval "$CI_PRE_CLONE_SCRIPT"=1B[0;m
=1B[32;1mFetching changes...=1B[0;m
Initialized empty Git repository in /builds/qemu-project/qemu/.git/
=1B[32;1mCreated fresh repository.=1B[0;m
=1B[32;1mChecking out 5f42c337 as master...=1B[0;m

=1B[32;1mSkipping Git submodules setup=1B[0;m
section_end:1593796459:get_sources
=1B[0Ksection_start:1593796459:step_script
=1B[0K=1B[0K=1B[36;1mExecuting "step_script" stage of the job script=1B[0=
;m
=1B[0;m=1B[32;1m$ dnf update -y=1B[0;m
Fedora Modular 31 - x86_64                      3.7 MB/s | 5.2 MB     00:=
01    =

Fedora Modular 31 - x86_64 - Updates            2.8 MB/s | 4.1 MB     00:=
01    =

Fedora 31 - x86_64 - Updates                    1.4 kB/s | 8.1 kB     00:=
05    =

Errors during downloading metadata for repository 'updates':
  - Downloading successful, but checksum doesn't match. Calculated: 0f5fc=
40ff497fe3cc6d2bf47de3d348674864633bd0663bbfc94ee405f737e697306dd1a94c716=
50d1578ce595bcf5b55e1122f4dc7246830cb52ef50e8f26cf(sha512) 0f5fc40ff497fe=
3cc6d2bf47de3d348674864633bd0663bbfc94ee405f737e697306dd1a94c71650d1578ce=
595bcf5b55e1122f4dc7246830cb52ef50e8f26cf(sha512) 0f5fc40ff497fe3cc6d2bf4=
7de3d348674864633bd0663bbfc94ee405f737e697306dd1a94c71650d1578ce595bcf5b5=
5e1122f4dc7246830cb52ef50e8f26cf(sha512)  Expected: c4d63059c930cf5f6574c=
119d7a25d543802581cfb6f175101aa0731f453e73b098b944ef737c7e4d48dde6a3a5607=
49bccc50eb51e4add0e9b67ccd1a4e638d(sha512) 3b1c65ee5ed1e1ab3be4c0170926d2=
415f68ddbd158272ecf51f3da4ad48c935d00a38a891f229bbd452e90e26a21432034e6a7=
2bf8f32bdb162c70955183367(sha512) 149dd4bef3cbe549550616451c11589547eea9f=
2305c72c5b74331dcf7bb86a2b5d6039301e9ff1553731e6daaf11d688b2d62252aa8b076=
ca3b6cab1fb56fcf(sha512) =

Error: Failed to download metadata for repo 'updates': Cannot download re=
pomd.xml: Cannot download repodata/repomd.xml: All mirrors were tried
section_end:1593796471:step_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m


-- =

You're receiving this email because of your account on gitlab.com.




----==_mimepart_5eff72932f1a3_36b33fb44495431c74218
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
<title>QEMU | Pipeline #162951134 has failed for master | 5f42c337</title=
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
<a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/5f42c3375d45108c=
f14f50ac8ba57c2865e75e9c" style=3D"color: #3777b0; text-decoration: none;=
">
5f42c337
</a>
</td>
</tr>
</tbody>
</table>
<div class=3D"commit" style=3D"color: #5c5c5c; font-weight: 300;">
Merge remote-tracking branch 'remotes/alistair/...
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
<a href=3D"https://gitlab.com/qemu-project/qemu/-/pipelines/162951134" st=
yle=3D"color: #3777b0; text-decoration: none;">
#162951134
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
1
failed
build.
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
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/623454255" style=3D=
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
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>Running w=
ith gitlab-runner 13.1.0 (6214287e)<br /></span><span>  on docker-auto-sc=
ale 72989761<br /></span><div class=3D"section-start" data-timestamp=3D"1=
593796383" data-section=3D"prepare-executor" role=3D"button"></div><span =
class=3D"term-fg-l-cyan term-bold section section-header js-s-prepare-exe=
cutor">Preparing the "docker+machine" executor</span><span class=3D"secti=
on section-header js-s-prepare-executor"><br /></span><span class=3D"sect=
ion line js-s-prepare-executor">Using Docker executor with image fedora:l=
atest ...<br /></span><span class=3D"section line js-s-prepare-executor">=
Pulling docker image fedora:latest ...<br /></span><span class=3D"section=
 line js-s-prepare-executor">Using docker image sha256:adfbfa4a115a799771=
d3060d0aa213584c91e549187da4fb0036240294ca4a8f for fedora:latest ...<br /=
></span><div class=3D"section-end" data-section=3D"prepare-executor"></di=
v><div class=3D"section-start" data-timestamp=3D"1593796394" data-section=
=3D"prepare-script" role=3D"button"></div><span class=3D"term-fg-l-cyan t=
erm-bold section section-header js-s-prepare-script">Preparing environmen=
t</span><span class=3D"section section-header js-s-prepare-script"><br />=
</span><span class=3D"section line js-s-prepare-script">Running on runner=
-72989761-project-11167699-concurrent-0 via runner-72989761-srm-159379629=
6-233333bb...<br /></span><div class=3D"section-end" data-section=3D"prep=
are-script"></div><div class=3D"section-start" data-timestamp=3D"15937963=
97" data-section=3D"get-sources" role=3D"button"></div><span class=3D"ter=
m-fg-l-cyan term-bold section section-header js-s-get-sources">Getting so=
urce from Git repository</span><span class=3D"section section-header js-s=
-get-sources"><br /></span><span class=3D"term-fg-l-green term-bold secti=
on line js-s-get-sources">$ eval "$CI_PRE_CLONE_SCRIPT"</span><span class=
=3D"section line js-s-get-sources"><br /></span><span class=3D"term-fg-l-=
green term-bold section line js-s-get-sources">Fetching changes...</span>=
<span class=3D"section line js-s-get-sources"><br />Initialized empty Git=
 repository in /builds/qemu-project/qemu/.git/<br /></span><span class=3D=
"term-fg-l-green term-bold section line js-s-get-sources">Created fresh r=
epository.</span><span class=3D"section line js-s-get-sources"><br /></sp=
an><span class=3D"term-fg-l-green term-bold section line js-s-get-sources=
">Checking out 5f42c337 as master...</span><span class=3D"section line js=
-s-get-sources"><br /><br /></span><span class=3D"term-fg-l-green term-bo=
ld section line js-s-get-sources">Skipping Git submodules setup</span><sp=
an class=3D"section line js-s-get-sources"><br /></span><div class=3D"sec=
tion-end" data-section=3D"get-sources"></div><div class=3D"section-start"=
 data-timestamp=3D"1593796459" data-section=3D"step-script" role=3D"butto=
n"></div><span class=3D"term-fg-l-cyan term-bold section section-header j=
s-s-step-script">Executing "step_script" stage of the job script</span><s=
pan class=3D"section section-header js-s-step-script"><br /></span><span =
class=3D"term-fg-l-green term-bold section line js-s-step-script">$ dnf u=
pdate -y</span><span class=3D"section line js-s-step-script"><br />Fedora=
 Modular 31 - x86_64                      3.7 MB/s | 5.2 MB     00:01    =
<br />Fedora Modular 31 - x86_64 - Updates            2.8 MB/s | 4.1 MB  =
   00:01    <br />Fedora 31 - x86_64 - Updates                    1.4 kB/=
s | 8.1 kB     00:05    <br />Errors during downloading metadata for repo=
sitory 'updates':<br />  - Downloading successful, but checksum doesn't m=
atch. Calculated: 0f5fc40ff497fe3cc6d2bf47de3d348674864633bd0663bbfc94ee4=
05f737e697306dd1a94c71650d1578ce595bcf5b55e1122f4dc7246830cb52ef50e8f26cf=
(sha512) 0f5fc40ff497fe3cc6d2bf47de3d348674864633bd0663bbfc94ee405f737e69=
7306dd1a94c71650d1578ce595bcf5b55e1122f4dc7246830cb52ef50e8f26cf(sha512) =
0f5fc40ff497fe3cc6d2bf47de3d348674864633bd0663bbfc94ee405f737e697306dd1a9=
4c71650d1578ce595bcf5b55e1122f4dc7246830cb52ef50e8f26cf(sha512)  Expected=
: c4d63059c930cf5f6574c119d7a25d543802581cfb6f175101aa0731f453e73b098b944=
ef737c7e4d48dde6a3a560749bccc50eb51e4add0e9b67ccd1a4e638d(sha512) 3b1c65e=
e5ed1e1ab3be4c0170926d2415f68ddbd158272ecf51f3da4ad48c935d00a38a891f229bb=
d452e90e26a21432034e6a72bf8f32bdb162c70955183367(sha512) 149dd4bef3cbe549=
550616451c11589547eea9f2305c72c5b74331dcf7bb86a2b5d6039301e9ff1553731e6da=
af11d688b2d62252aa8b076ca3b6cab1fb56fcf(sha512) <br />Error: Failed to do=
wnload metadata for repo 'updates': Cannot download repomd.xml: Cannot do=
wnload repodata/repomd.xml: All mirrors were tried<br /></span><div class=
=3D"section-end" data-section=3D"step-script"></div><span class=3D"term-f=
g-l-red term-bold">ERROR: Job failed: exit code 1<br /></span></pre>
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

----==_mimepart_5eff72932f1a3_36b33fb44495431c74218--

