Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C844745B9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 15:59:06 +0100 (CET)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9Gj-00048l-Up
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 09:59:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avraham.guy@gmail.com>)
 id 1mx86o-0002yj-D3
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:44:51 -0500
Received: from [2607:f8b0:4864:20::636] (port=34726
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <avraham.guy@gmail.com>)
 id 1mx86k-00061L-8O
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:44:45 -0500
Received: by mail-pl1-x636.google.com with SMTP id y8so13599783plg.1
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=UQFV0JJMa41hROtzDEhOj0YN9QkIye5XJEi2GrUG0HQ=;
 b=g89hHQL/Hrxe9WGerNRyJgb5Iszgxnh0v9DEOLtZ11oVkuRAUMR3SuF/WR5M7mz+Bj
 OtlWqarsYA80WuSSW9ll64GRNfTi4z7bQ986wmpPSWqKDpibBAyM1YI1AS4D9z9basdy
 ZKrE3UIvwkKlvw2Nu9m5v7xSqpdYdb/vzUvubdPffxhVkZWGDSw+KSRJzpTsex5pOOOF
 8vfBIMouqSZSlVcSp9Q0nRPwohDPivRDtSiw2vhq9utdFUd0NbvbfFdMenfNpLm88WZU
 TjJvIIhYlFwzp1g4x2XDQTx4/Dl1vSjglj49LunoeopZFRW9403EdmQnorbQNPcOaQ7o
 Ag0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UQFV0JJMa41hROtzDEhOj0YN9QkIye5XJEi2GrUG0HQ=;
 b=DjMhD6jbhGOs9o07keN1j7ciaGedAxhIy4zQANSDaTOCKi2RKV+4RduQi/Uidcdn2n
 hyOkYzMl9H+f4Uq1BclGU5cW0hlO7zl8GdaM88WLI8ZFTVuowNylk8fSKh9Ng7KTX2rj
 hbv55PMBGeQGrixyD11hqgdDTB5/85rir4Pa1EU+Uq/viCgjAf1vcjaA2LlZ4DL7mJgu
 8t5+EJRrqtXhjSoyrtaZDhuF1O//PHErU/YFLb1Vakwo6FfbYGdne4lVlaYJMDwsMKMB
 ZcDkKbQH5if3YCvubwbSP8zHqaiq+Tv2dJrcYZ7+Klr8Iokmi3EBx5W/WXRnljc1ADWl
 Vg9A==
X-Gm-Message-State: AOAM533Vqj9DyYMInLByL+f1LNnbu5BYn6or6MWsSozCsGJ/ioZ9k5os
 Hvcy7+rsp91PVuhbbzIhB5ZXahMEAqs9TqTiKbJrFOW3WRgTBNRllv4=
X-Google-Smtp-Source: ABdhPJw381ClprzmOSZsU2Y/bOIN363uWqGIh72DKB/R3Nwxm3ifJmFg0AvxWA6hkz4FVOU6jcwn65H1uLVSJI7E2ys=
X-Received: by 2002:a17:90b:3908:: with SMTP id
 ob8mr5706342pjb.57.1639489475906; 
 Tue, 14 Dec 2021 05:44:35 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?15LXmdeQ?= <avraham.guy@gmail.com>
Date: Tue, 14 Dec 2021 16:44:23 +0300
Message-ID: <CADHXGBzqDHgvFJFzk-QydLUyzw00Rgnbw717bZ3hMyFPwHziaw@mail.gmail.com>
Subject: error in qemu mac install ..
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d30f7105d31b6398"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=avraham.guy@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Dec 2021 09:54:44 -0500
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

--000000000000d30f7105d31b6398
Content-Type: text/plain; charset="UTF-8"

Hey

trying to install for the 1st time and i got a message to contact you.

also, the mouse is caught by the qemu but not moving ... so not possible to
format the hdd .. and continue.


guy@guyaHP:~/Downloads/macOS-Simple-KVM-master$ sudo ./basic.sh
Home directory not accessible: Permission denied
pulseaudio: pa_context_connect() failed
pulseaudio: Reason: Connection refused
pulseaudio: Failed to initialize PA contextaudio: Could not init `pa' audio
driver
Home directory not accessible: Permission denied
ALSA lib confmisc.c:767:(parse_card) cannot find card '0'
ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_card_driver
returned error: No such file or directory
ALSA lib confmisc.c:392:(snd_func_concat) error evaluating strings
ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_concat
returned error: No such file or directory
ALSA lib confmisc.c:1246:(snd_func_refer) error evaluating name
ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_refer
returned error: No such file or directory
ALSA lib conf.c:5007:(snd_config_expand) Evaluate error: No such file or
directory
ALSA lib pcm.c:2495:(snd_pcm_open_noupdate) Unknown PCM default
alsa: Could not initialize DAC
alsa: Failed to open `default':
alsa: Reason: No such file or directory
ALSA lib confmisc.c:767:(parse_card) cannot find card '0'
ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_card_driver
returned error: No such file or directory
ALSA lib confmisc.c:392:(snd_func_concat) error evaluating strings
ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_concat
returned error: No such file or directory
ALSA lib confmisc.c:1246:(snd_func_refer) error evaluating name
ALSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_refer
returned error: No such file or directory
ALSA lib conf.c:5007:(snd_config_expand) Evaluate error: No such file or
directory
ALSA lib pcm.c:2495:(snd_pcm_open_noupdate) Unknown PCM default
alsa: Could not initialize DAC
alsa: Failed to open `default':
alsa: Reason: No such file or directory
audio: Failed to create voice `dac'
unknown keycodes `(unnamed)', please report to qemu-devel@nongnu.org
./basic.sh: line 30: -device: command not found


Thank you

Guy

--000000000000d30f7105d31b6398
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey</div><div><br></div><div>trying to install for th=
e 1st time and i got a message to contact you.</div><div><br></div><div>als=
o, the mouse is caught=C2=A0by the qemu but not moving ... so not possible =
to format the hdd .. and continue.</div><div><br></div><div><br></div>guy@g=
uyaHP:~/Downloads/macOS-Simple-KVM-master$ sudo ./basic.sh<br>Home director=
y not accessible: Permission denied<br>pulseaudio: pa_context_connect() fai=
led<br>pulseaudio: Reason: Connection refused<br>pulseaudio: Failed to init=
ialize PA contextaudio: Could not init `pa&#39; audio driver<br>Home direct=
ory not accessible: Permission denied<br>ALSA lib confmisc.c:767:(parse_car=
d) cannot find card &#39;0&#39;<br>ALSA lib conf.c:4528:(_snd_config_evalua=
te) function snd_func_card_driver returned error: No such file or directory=
<br>ALSA lib confmisc.c:392:(snd_func_concat) error evaluating strings<br>A=
LSA lib conf.c:4528:(_snd_config_evaluate) function snd_func_concat returne=
d error: No such file or directory<br>ALSA lib confmisc.c:1246:(snd_func_re=
fer) error evaluating name<br>ALSA lib conf.c:4528:(_snd_config_evaluate) f=
unction snd_func_refer returned error: No such file or directory<br>ALSA li=
b conf.c:5007:(snd_config_expand) Evaluate error: No such file or directory=
<br>ALSA lib pcm.c:2495:(snd_pcm_open_noupdate) Unknown PCM default<br>alsa=
: Could not initialize DAC<br>alsa: Failed to open `default&#39;:<br>alsa: =
Reason: No such file or directory<br>ALSA lib confmisc.c:767:(parse_card) c=
annot find card &#39;0&#39;<br>ALSA lib conf.c:4528:(_snd_config_evaluate) =
function snd_func_card_driver returned error: No such file or directory<br>=
ALSA lib confmisc.c:392:(snd_func_concat) error evaluating strings<br>ALSA =
lib conf.c:4528:(_snd_config_evaluate) function snd_func_concat returned er=
ror: No such file or directory<br>ALSA lib confmisc.c:1246:(snd_func_refer)=
 error evaluating name<br>ALSA lib conf.c:4528:(_snd_config_evaluate) funct=
ion snd_func_refer returned error: No such file or directory<br>ALSA lib co=
nf.c:5007:(snd_config_expand) Evaluate error: No such file or directory<br>=
ALSA lib pcm.c:2495:(snd_pcm_open_noupdate) Unknown PCM default<br>alsa: Co=
uld not initialize DAC<br>alsa: Failed to open `default&#39;:<br>alsa: Reas=
on: No such file or directory<br>audio: Failed to create voice `dac&#39;<br=
>unknown keycodes `(unnamed)&#39;, please report to <a href=3D"mailto:qemu-=
devel@nongnu.org">qemu-devel@nongnu.org</a><br>./basic.sh: line 30: -device=
: command not found<br><div><br></div><div><br></div><div>Thank you</div><d=
iv><br></div><div>Guy</div></div>

--000000000000d30f7105d31b6398--

