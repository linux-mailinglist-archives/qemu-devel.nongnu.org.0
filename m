Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780DE23091C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 13:43:43 +0200 (CEST)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0O1G-0006VV-IS
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 07:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com>)
 id 1k0NyT-0003uV-Qs
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 07:40:49 -0400
Received: from do158-143.mg.gitlab.com ([192.237.158.143]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com>)
 id 1k0NyQ-0002so-AY
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 07:40:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.gitlab.com;
 q=dns/txt; 
 s=mailo; t=1595936445; h=List-Id: Content-Transfer-Encoding:
 Content-Type: Mime-Version: Subject: Message-ID: Reply-To: From: Date:
 Sender; bh=3Ezdy44c9wOwH5pF+0fEoF2ARL+EeNtdDtYOhUpTU+A=;
 b=DLtH5TQvTpckIF+4se6ZF2FxpsB1MYn3tu5Nn2MpZHDmWEYh+rhwF6mhKRTWVA9xo993GNRg
 Pdj2b6ZZCUOwwwkrbQqHj2YAWWYKemir7jesqzLp4aoIII+YcrlPGBZ4cNJlDt04dNBdG1zI
 kF586jwxehuKmlNmbzfU7LyhMbc=
X-Mailgun-Sending-Ip: 192.237.158.143
X-Mailgun-Sid: WyI3MWYzYSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOTQ3YjQiXQ==
Received: from mg.gitlab.com (65.90.74.34.bc.googleusercontent.com
 [34.74.90.65]) by smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f200ebc7ab15087eb9e9dc5 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 28 Jul 2020 11:40:44 GMT
Date: Tue, 28 Jul 2020 11:40:44 +0000
Message-ID: <5f200ebc1f593_58793fe750304298639f8@sidekiq-catchall-02-sv-gprd.mail>
Subject: QEMU | Pipeline #171559395 has failed for master | 23ae2878
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_5f200ebc1241f_58793fe75030429863820";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitLab-Project: QEMU
X-GitLab-Project-Id: 11167699
X-GitLab-Project-Path: qemu-project/qemu
X-GitLab-Pipeline-Id: 171559395
X-GitLab-Pipeline-Ref: master
X-GitLab-Pipeline-Status: failed
Auto-Submitted: auto-generated
X-Auto-Response-Suppress: All
Received-SPF: pass client-ip=192.237.158.143;
 envelope-from=bounce+2dc402.947b4-qemu-devel=nongnu.org@mg.gitlab.com;
 helo=do158-143.mg.gitlab.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 07:01:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HTML_FONT_LOW_CONTRAST=0.001, HTML_MESSAGE=0.001, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-1, REPLYTO_WITHOUT_TO_CC=1.552,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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


----==_mimepart_5f200ebc1241f_58793fe75030429863820
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable



Your pipeline has failed.

Project: QEMU ( https://gitlab.com/qemu-project/qemu )
Branch: master ( https://gitlab.com/qemu-project/qemu/-/commits/master )

Commit: 23ae2878 ( https://gitlab.com/qemu-project/qemu/-/commit/23ae2878=
3f4674e98f7539d1c05d793166c2fc12 )
Commit Message: Merge remote-tracking branch 'remotes/maxreitz/...
Commit Author: Peter Maydell ( https://gitlab.com/pm215 )

Pipeline #171559395 ( https://gitlab.com/qemu-project/qemu/-/pipelines/17=
1559395 ) triggered by Alex Benn=C3=A9e ( https://gitlab.com/stsquad )
had 2 failed builds.

Job #659352117 ( https://gitlab.com/qemu-project/qemu/-/jobs/659352117/ra=
w )

Stage: test
Name: acceptance-system-fedora-alt
Trace:     self.wait_for_console_pattern('QEMU advent calendar')

11:28:43 ERROR|   File "/builds/qemu-project/qemu/build/tests/acceptance/=
boot_linux_console.py", line 51, in wait_for_console_pattern
    wait_for_console_pattern(self, success_message,

11:28:43 ERROR|   File "/builds/qemu-project/qemu/build/tests/acceptance/=
avocado_qemu/__init__.py", line 131, in wait_for_console_pattern
    _console_interaction(test, success_message, failure_message, None, vm=
=3Dvm)

11:28:43 ERROR|   File "/builds/qemu-project/qemu/build/tests/acceptance/=
avocado_qemu/__init__.py", line 83, in _console_interaction
    msg =3D console.readline().strip()

11:28:43 ERROR|   File "/usr/lib64/python3.8/socket.py", line 669, in rea=
dinto
    return self._sock.recv_into(b)

11:28:43 ERROR|   File "/builds/qemu-project/qemu/build/tests/venv/lib64/=
python3.8/site-packages/avocado/plugins/runner.py", line 89, in sigterm_h=
andler
    raise RuntimeError("Test interrupted by SIGTERM")

11:28:43 ERROR| RuntimeError: Test interrupted by SIGTERM

11:28:43 ERROR| ERROR 10-tests/acceptance/boot_linux_console.py:BootLinux=
Console.test_microblaze_s3adsp1800 -> RuntimeError: Test interrupted by S=
IGTERM
11:28:43 INFO | =


Runner error occurred: Timeout reached
Original status: ERROR
{'name': '10-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test=
_microblaze_s3adsp1800', 'logdir': '/builds/qemu-project/qemu/build/tests=
/results/job-2020-07-28T11.19-efde134/test-results/10-tests_acceptance_bo=
ot_linux_console.py_BootLinuxConsole.test_microblaze_s3adsp1800', 'logfil=
e': '/builds/qemu-project/qemu/build/tests/results/job-2020-07-28T11.19-e=
fde134/test-results/10-tests_acceptance_boot_linux_console.py_BootLinuxCo=
nsole.test_microblaze_s3adsp1800/debug.log', 'status': 'ERROR', 'running'=
: False, 'paused': False, 'time_start': 1595935633.4017432, 'time_elapsed=
': 90.50257182121277, 'time_end': 1595935723.904315, 'fail_reason': 'Test=
 interrupted by SIGTERM', 'fail_class': 'RuntimeError', 'traceback': 'Tra=
ceback (most recent call last):\n  File "/builds/qemu-project/qemu/build/=
tests/venv/lib64/python3.8/site-packages/avocado/core/test.py", line 955,=
 in _run_avocado\n    raise test_exception\n  File "/builds/qemu-project/=
qemu/build/tests/venv/lib64/python3.8/site-packages/avocado/core/test.py"=
, line 855, in _run_avocado\n    testMethod()\n  File "/builds/qemu-proje=
ct/qemu/build/tests/acceptance/boot_linux_console.py", line 917, in test_=
microblaze_s3adsp1800\n    self.do_test_advcal_2018(\'17\', tar_hash, \'b=
allerina.bin\')\n  File "/builds/qemu-project/qemu/build/tests/acceptance=
/boot_linux_console.py", line 892, in do_test_advcal_2018\n    self.wait_=
for_console_pattern(\'QEMU advent calendar\')\n  File "/builds/qemu-proje=
ct/qemu/build/tests/acceptance/boot_linux_console.py", line 51, in wait_f=
or_console_pattern\n    wait_for_console_pattern(self, success_message,\n=
  File "/builds/qemu-project/qemu/build/tests/acceptance/avocado_qemu/__i=
nit__.py", line 131, in wait_for_console_pattern\n    _console_interactio=
n(test, success_message, failure_message, None, vm=3Dvm)\n  File "/builds=
/qemu-project/qemu/build/tests/acceptance/avocado_qemu/__init__.py", line=
 83, in _console_interaction\n    msg =3D console.readline().strip()\n  F=
ile "/usr/lib64/python3.8/socket.py", line 669, in readinto\n    return s=
elf._sock.recv_into(b)\n  File "/builds/qemu-project/qemu/build/tests/ven=
v/lib64/python3.8/site-packages/avocado/plugins/runner.py", line 89, in s=
igterm_handler\n    raise RuntimeError("Test interrupted by SIGTERM")\nRu=
ntimeError: Test interrupted by SIGTERM\n', 'timeout': 90, 'whiteboard': =
'', 'phase': 'FINISHED', 'class_name': 'BootLinuxConsole', 'job_logdir': =
'/builds/qemu-project/qemu/build/tests/results/job-2020-07-28T11.19-efde1=
34', 'job_unique_id': 'efde134dcb45267f1ff9ee01a594f11812316a60', 'params=
': []}
=1B[32;1m$ du -chs $HOME/avocado/data/cache=1B[0;m
du: cannot access '/root/avocado/data/cache': No such file or directory
0	total
section_end:1595935790:after_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m

Job #659352096 ( https://gitlab.com/qemu-project/qemu/-/jobs/659352096/ra=
w )

Stage: build
Name: build-tcg-disabled
Trace: 192      ...        [10:57:48]             ...              =

192      =1B[32mpass      =1B[0m [10:57:48] [10:57:48]   0s              =
 =

194      ...        [10:57:48]             ...              =

194      =1B[32mpass      =1B[0m [10:57:48] [10:57:48]   0s              =
 =

197      ...        [10:57:48]             ...              =

197      =1B[1m=1B[31mfail      =1B[0m [10:57:48] [10:59:34]             =
       output mismatch (see 197.out.bad)
--- /builds/qemu-project/qemu/tests/qemu-iotests/197.out	2020-07-28 10:47=
:16.000000000 +0000
+++ /builds/qemu-project/qemu/build/tests/qemu-iotests/197.out.bad	2020-0=
7-28 10:59:33.000000000 +0000
@@ -26,9 +26,9 @@
 =

 =3D=3D=3D Partial final cluster =3D=3D=3D
 =

-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1024
+qemu-img: TEST_DIR/t.IMGFMT: Invalid parameter 'compat'
 read 1024/1024 bytes at offset 0
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
+4 GiB (0x100000000) bytes     allocated at offset 0 bytes (0x0)
 No errors were found on the image.
 *** done
208      ...        [10:59:34]             ...              =

208      =1B[32mpass      =1B[0m [10:59:34] [10:59:37]   3s              =
 =

215      ...        [10:59:37]             ...              =

215      =1B[32mpass      =1B[0m [10:59:37] [11:01:09]  91s              =
 =

221      ...        [11:01:09]             ...              =

221      =1B[32mpass      =1B[0m [11:01:09] [11:01:09]   0s              =
 =

222      ...        [11:01:09]             ...              =

222      =1B[32mpass      =1B[0m [11:01:09] [11:01:12]   3s              =
 =

226      ...        [11:01:12]             ...              =

226      =1B[32mpass      =1B[0m [11:01:12] [11:01:13]   1s              =
 =

227      ...        [11:01:13]             ...              =

227      =1B[32mpass      =1B[0m [11:01:13] [11:01:13]   0s              =
 =

236      ...        [11:01:13]             ...              =

236      =1B[32mpass      =1B[0m [11:01:13] [11:01:13]   0s              =
 =

253      ...        [11:01:13]             ...              =

253      =1B[32mpass      =1B[0m [11:01:13] [11:01:13]   0s              =
 =

277      ...        [11:01:13]             ...              =

277      =1B[32mpass      =1B[0m [11:01:13] [11:01:15]   2s              =
 =

Failures: 197
Failed 1 of 47 iotests
section_end:1595934090:step_script
=1B[0K=1B[31;1mERROR: Job failed: exit code 1
=1B[0;m


-- =

You're receiving this email because of your account on gitlab.com.




----==_mimepart_5f200ebc1241f_58793fe75030429863820
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
<title>QEMU | Pipeline #171559395 has failed for master | 23ae2878</title=
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
#fff">
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
<a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/23ae28783f4674e9=
8f7539d1c05d793166c2fc12" style=3D"color: #3777b0; text-decoration: none;=
">
23ae2878
</a>
</td>
</tr>
</tbody>
</table>
<div class=3D"commit" style=3D"color: #5c5c5c; font-weight: 300;">
Merge remote-tracking branch 'remotes/maxreitz/...
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
<a href=3D"https://gitlab.com/qemu-project/qemu/-/pipelines/171559395" st=
yle=3D"color: #3777b0; text-decoration: none;">
#171559395
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
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/659352117" style=3D=
"color: #3777b0; text-decoration: none;">
acceptance-system-fedora-alt
</a>

</td>
</tr>
<tr class=3D"build-log">
<td colspan=3D"2" style=3D"font-family: 'Helvetica Neue',Helvetica,Arial,=
sans-serif; padding: 0 0 16px;">
<pre style=3D"font-family: Monaco,'Lucida Console','Courier New',Courier,=
monospace; background-color: #fafafa; border-radius: 4px; overflow: hidde=
n; white-space: pre-wrap; word-break: break-all; font-size: 13px; line-he=
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>    self.=
wait_for_console_pattern('QEMU advent calendar')<br /><br />11:28:43 ERRO=
R|   File "/builds/qemu-project/qemu/build/tests/acceptance/boot_linux_co=
nsole.py", line 51, in wait_for_console_pattern<br />    wait_for_console=
_pattern(self, success_message,<br /><br />11:28:43 ERROR|   File "/build=
s/qemu-project/qemu/build/tests/acceptance/avocado_qemu/__init__.py", lin=
e 131, in wait_for_console_pattern<br />    _console_interaction(test, su=
ccess_message, failure_message, None, vm=3Dvm)<br /><br />11:28:43 ERROR|=
   File "/builds/qemu-project/qemu/build/tests/acceptance/avocado_qemu/__=
init__.py", line 83, in _console_interaction<br />    msg =3D console.rea=
dline().strip()<br /><br />11:28:43 ERROR|   File "/usr/lib64/python3.8/s=
ocket.py", line 669, in readinto<br />    return self._sock.recv_into(b)<=
br /><br />11:28:43 ERROR|   File "/builds/qemu-project/qemu/build/tests/=
venv/lib64/python3.8/site-packages/avocado/plugins/runner.py", line 89, i=
n sigterm_handler<br />    raise RuntimeError("Test interrupted by SIGTER=
M")<br /><br />11:28:43 ERROR| RuntimeError: Test interrupted by SIGTERM<=
br /><br />11:28:43 ERROR| ERROR 10-tests/acceptance/boot_linux_console.p=
y:BootLinuxConsole.test_microblaze_s3adsp1800 -&gt; RuntimeError: Test in=
terrupted by SIGTERM<br />11:28:43 INFO | <br /><br />Runner error occurr=
ed: Timeout reached<br />Original status: ERROR<br />{'name': '10-tests/a=
cceptance/boot_linux_console.py:BootLinuxConsole.test_microblaze_s3adsp18=
00', 'logdir': '/builds/qemu-project/qemu/build/tests/results/job-2020-07=
-28T11.19-efde134/test-results/10-tests_acceptance_boot_linux_console.py_=
BootLinuxConsole.test_microblaze_s3adsp1800', 'logfile': '/builds/qemu-pr=
oject/qemu/build/tests/results/job-2020-07-28T11.19-efde134/test-results/=
10-tests_acceptance_boot_linux_console.py_BootLinuxConsole.test_microblaz=
e_s3adsp1800/debug.log', 'status': 'ERROR', 'running': False, 'paused': F=
alse, 'time_start': 1595935633.4017432, 'time_elapsed': 90.50257182121277=
, 'time_end': 1595935723.904315, 'fail_reason': 'Test interrupted by SIGT=
ERM', 'fail_class': 'RuntimeError', 'traceback': 'Traceback (most recent =
call last):\n  File "/builds/qemu-project/qemu/build/tests/venv/lib64/pyt=
hon3.8/site-packages/avocado/core/test.py", line 955, in _run_avocado\n  =
  raise test_exception\n  File "/builds/qemu-project/qemu/build/tests/ven=
v/lib64/python3.8/site-packages/avocado/core/test.py", line 855, in _run_=
avocado\n    testMethod()\n  File "/builds/qemu-project/qemu/build/tests/=
acceptance/boot_linux_console.py", line 917, in test_microblaze_s3adsp180=
0\n    self.do_test_advcal_2018(\'17\', tar_hash, \'ballerina.bin\')\n  F=
ile "/builds/qemu-project/qemu/build/tests/acceptance/boot_linux_console.=
py", line 892, in do_test_advcal_2018\n    self.wait_for_console_pattern(=
\'QEMU advent calendar\')\n  File "/builds/qemu-project/qemu/build/tests/=
acceptance/boot_linux_console.py", line 51, in wait_for_console_pattern\n=
    wait_for_console_pattern(self, success_message,\n  File "/builds/qemu=
-project/qemu/build/tests/acceptance/avocado_qemu/__init__.py", line 131,=
 in wait_for_console_pattern\n    _console_interaction(test, success_mess=
age, failure_message, None, vm=3Dvm)\n  File "/builds/qemu-project/qemu/b=
uild/tests/acceptance/avocado_qemu/__init__.py", line 83, in _console_int=
eraction\n    msg =3D console.readline().strip()\n  File "/usr/lib64/pyth=
on3.8/socket.py", line 669, in readinto\n    return self._sock.recv_into(=
b)\n  File "/builds/qemu-project/qemu/build/tests/venv/lib64/python3.8/si=
te-packages/avocado/plugins/runner.py", line 89, in sigterm_handler\n    =
raise RuntimeError("Test interrupted by SIGTERM")\nRuntimeError: Test int=
errupted by SIGTERM\n', 'timeout': 90, 'whiteboard': '', 'phase': 'FINISH=
ED', 'class_name': 'BootLinuxConsole', 'job_logdir': '/builds/qemu-projec=
t/qemu/build/tests/results/job-2020-07-28T11.19-efde134', 'job_unique_id'=
: 'efde134dcb45267f1ff9ee01a594f11812316a60', 'params': []}<br /></span><=
span class=3D"term-fg-l-green term-bold">$ du -chs $HOME/avocado/data/cac=
he</span><span><br />du: cannot access '/root/avocado/data/cache': No suc=
h file or directory<br />0	total<br /></span><span class=3D"term-fg-l-red=
 term-bold">ERROR: Job failed: exit code 1<br /></span></pre>
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
build
</td>
</tr>
</tbody>
</table>
</td>
<td align=3D"right" style=3D"font-family: 'Helvetica Neue',Helvetica,Aria=
l,sans-serif; color: #8c8c8c; font-weight: 500; font-size: 14px; padding:=
 16px 0;">
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/659352096" style=3D=
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
ight: 1.4; color: #333333; margin: 0; padding: 16px 8px;"><span>192      =
...        [10:57:48]             ...              =

192      </span><span class=3D"term-fg-green">pass      </span><span> [10=
:57:48] [10:57:48]   0s               <br />194      ...        [10:57:48=
]             ...              =

194      </span><span class=3D"term-fg-green">pass      </span><span> [10=
:57:48] [10:57:48]   0s               <br />197      ...        [10:57:48=
]             ...              =

197      </span><span class=3D"term-fg-l-red term-bold">fail      </span>=
<span> [10:57:48] [10:59:34]                    output mismatch (see 197.=
out.bad)<br />--- /builds/qemu-project/qemu/tests/qemu-iotests/197.out	20=
20-07-28 10:47:16.000000000 +0000<br />+++ /builds/qemu-project/qemu/buil=
d/tests/qemu-iotests/197.out.bad	2020-07-28 10:59:33.000000000 +0000<br /=
>@@ -26,9 +26,9 @@<br /> <br /> =3D=3D=3D Partial final cluster =3D=3D=3D=
<br /> <br />-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1024<br=
 />+qemu-img: TEST_DIR/t.IMGFMT: Invalid parameter 'compat'<br /> read 10=
24/1024 bytes at offset 0<br /> 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and=
 XXX ops/sec)<br />-1 KiB (0x400) bytes     allocated at offset 0 bytes (=
0x0)<br />+4 GiB (0x100000000) bytes     allocated at offset 0 bytes (0x0=
)<br /> No errors were found on the image.<br /> *** done<br />208      .=
..        [10:59:34]             ...              =

208      </span><span class=3D"term-fg-green">pass      </span><span> [10=
:59:34] [10:59:37]   3s               <br />215      ...        [10:59:37=
]             ...              =

215      </span><span class=3D"term-fg-green">pass      </span><span> [10=
:59:37] [11:01:09]  91s               <br />221      ...        [11:01:09=
]             ...              =

221      </span><span class=3D"term-fg-green">pass      </span><span> [11=
:01:09] [11:01:09]   0s               <br />222      ...        [11:01:09=
]             ...              =

222      </span><span class=3D"term-fg-green">pass      </span><span> [11=
:01:09] [11:01:12]   3s               <br />226      ...        [11:01:12=
]             ...              =

226      </span><span class=3D"term-fg-green">pass      </span><span> [11=
:01:12] [11:01:13]   1s               <br />227      ...        [11:01:13=
]             ...              =

227      </span><span class=3D"term-fg-green">pass      </span><span> [11=
:01:13] [11:01:13]   0s               <br />236      ...        [11:01:13=
]             ...              =

236      </span><span class=3D"term-fg-green">pass      </span><span> [11=
:01:13] [11:01:13]   0s               <br />253      ...        [11:01:13=
]             ...              =

253      </span><span class=3D"term-fg-green">pass      </span><span> [11=
:01:13] [11:01:13]   0s               <br />277      ...        [11:01:13=
]             ...              =

277      </span><span class=3D"term-fg-green">pass      </span><span> [11=
:01:13] [11:01:15]   2s               <br />Failures: 197<br />Failed 1 o=
f 47 iotests<br /></span><span class=3D"term-fg-l-red term-bold">ERROR: J=
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

----==_mimepart_5f200ebc1241f_58793fe75030429863820--

