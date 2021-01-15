Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA52F7D1B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:49:50 +0100 (CET)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PU5-0003Zz-Kh
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3C-0006nB-1A
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P36-0003Gv-1i
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n+0f7T9feeM5kOoR+IQ7ZKn+Xo55OkhxOvolp6IGpn0=;
 b=ZXhGEcGjW7oNLLvaclK1p0i+GQ0+grYcT4d+CJPSsMrc9+gfunNPGsnNBkkGwcZzWJtYk0
 iLuiyhp6JHmOq9hU8hrSm8QudheSalCZTapwiukF4+Is1Zfb7qRlS0QH2RepCJP0mC8JBg
 cUlwuon6H8ztu81FyhJo7np+TfREMvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-RjhoAD4INQapQ3vPiLUDgQ-1; Fri, 15 Jan 2021 08:21:51 -0500
X-MC-Unique: RjhoAD4INQapQ3vPiLUDgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C37AC180A09B
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:21:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90B5060BF3;
 Fri, 15 Jan 2021 13:21:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1764D1800606; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/30] Audio 20210115 patches
Date: Fri, 15 Jan 2021 14:21:16 +0100
Message-Id: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 45240eed4f064576d589ea60ebadf3c11d7ab891=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-yank-2021-01-13' i=
nt=3D=0D
o staging (2021-01-13 14:19:24 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/audio-20210115-pull-request=0D
=0D
for you to fetch changes up to 8abf3feb4d464abadd5133d8810c8a3232cbbe6e:=0D
=0D
  audio: space prohibited between function name and parenthesis'(' (2021-01=
-1=3D=0D
5 11:49:26 +0100)=0D
=0D
----------------------------------------------------------------=0D
audio: improvements for sdl, pulse, fsound.=0D
audio: cleanups & codestyle fixes.=0D
=0D
----------------------------------------------------------------=0D
=0D
Volker R=3DC3=3DBCmelin (23):=0D
  sdlaudio: remove leftover SDL1.2 code=0D
  audio: fix bit-rotted code=0D
  sdlaudio: add -audiodev sdl,out.buffer-count option=0D
  sdlaudio: don't start playback in init routine=0D
  sdlaudio: always clear the sample buffer=0D
  sdlaudio: fill remaining sample buffer with silence=0D
  sdlaudio: replace legacy functions with modern ones=0D
  audio: split pcm_ops function get_buffer_in=0D
  sdlaudio: add recording functions=0D
  audio: break generic buffer dependency on mixing-engine=0D
  sdlaudio: enable (in|out).mixing-engine=3D3Doff=0D
  audio: remove remaining unused plive code=0D
  paaudio: avoid to clip samples multiple times=0D
  paaudio: wait for PA_STREAM_READY in qpa_write()=0D
  paaudio: wait until the playback stream is ready=0D
  paaudio: remove unneeded code=0D
  paaudio: comment bugs in functions qpa_init_*=0D
  paaudio: limit minreq to 75% of audio timer_rate=0D
  paaudio: send recorded data in smaller chunks=0D
  dsoundaudio: replace GetForegroundWindow()=0D
  dsoundaudio: rename dsound_open()=0D
  dsoundaudio: enable f32 audio sample format=0D
  dsoundaudio: fix log message=0D
=0D
Zhang Han (7):=0D
  audio: Add braces for statements/fix braces' position=0D
  audio: Add spaces around operator/delete redundant spaces=0D
  audio: foo* bar" should be "foo *bar".=0D
  audio: Fix lines over 90 characters=0D
  audio: Don't use '%#' in format strings=0D
  audio: Suspect code indent for conditional statements=0D
  audio: space prohibited between function name and parenthesis'('=0D
=0D
 audio/audio_int.h       |   2 +=0D
 audio/audio_template.h  |  26 ++--=0D
 audio/dsound_template.h |   2 +-=0D
 audio/alsaaudio.c       |  18 +--=0D
 audio/audio.c           |  74 +++++-----=0D
 audio/audio_legacy.c    |   3 +-=0D
 audio/audio_win_int.c   |  67 ++++++---=0D
 audio/coreaudio.c       |  17 ++-=0D
 audio/dsoundaudio.c     |  56 +++++---=0D
 audio/jackaudio.c       |   3 +-=0D
 audio/noaudio.c         |   1 +=0D
 audio/ossaudio.c        |  13 +-=0D
 audio/paaudio.c         |  73 ++++++++--=0D
 audio/sdlaudio.c        | 309 ++++++++++++++++++++++++++++------------=0D
 audio/spiceaudio.c      |   1 +=0D
 qapi/audio.json         |  33 ++++-=0D
 qemu-options.hx         |   8 +-=0D
 17 files changed, 471 insertions(+), 235 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


