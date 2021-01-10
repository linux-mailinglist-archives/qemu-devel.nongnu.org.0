Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A8A2F0A30
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 00:12:13 +0100 (CET)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyjsY-0005hf-Ig
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 18:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1kyjqe-0004Q5-Qf
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 18:10:12 -0500
Received: from mailout11.t-online.de ([194.25.134.85]:40744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1kyjqX-0007Q0-Vc
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 18:10:08 -0500
Received: from fwd09.aul.t-online.de (fwd09.aul.t-online.de [172.20.27.151])
 by mailout11.t-online.de (Postfix) with SMTP id 9C43D422478D;
 Mon, 11 Jan 2021 00:10:02 +0100 (CET)
Received: from [192.168.211.200]
 (r9JxYaZXoh7Rxa7wwxwjS7JJIUo2f1Tb3T+aFN+rpNfmeria6dCxljRBTxnOpFqZKV@[93.236.152.29])
 by fwd09.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyjqO-12pgvY0; Mon, 11 Jan 2021 00:09:56 +0100
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 00/23] next round of audio patches
To: qemu-devel@nongnu.org
References: <161027429200.26448.9935040201825488783@5f806b4aa85b>
Message-ID: <08089568-0f62-f2f6-eb3c-f08c870a10bf@t-online.de>
Date: Mon, 11 Jan 2021 00:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161027429200.26448.9935040201825488783@5f806b4aa85b>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ID: r9JxYaZXoh7Rxa7wwxwjS7JJIUo2f1Tb3T+aFN+rpNfmeria6dCxljRBTxnOpFqZKV
X-TOI-EXPURGATEID: 150726::1610320196-00010299-72440607/0/0 CLEAN NORMAL
X-TOI-MSGID: e2d221c7-3701-4b60-aa40-f8eb93fc9ed2
Received-SPF: none client-ip=194.25.134.85; envelope-from=vr_qemu@t-online.de;
 helo=mailout11.t-online.de
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: dirty.ice.hu@gmail.com, kraxel@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Patchew URL: https://patchew.org/QEMU/9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de/
>
>
>
> Hi,
>
> This series seems to have some coding style problems. See output below for
> more information:
>
> Type: series
> Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
> Subject: [PATCH 00/23] next round of audio patches
>
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
>
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de -> patchew/9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
> Switched to a new branch 'test'
> f5676b9 dsoundaudio: fix log message
> 825e3ad dsoundaudio: enable f32 audio sample format
> ead5e23 dsoundaudio: rename dsound_open()
> 3bf4a8e dsoundaudio: replace GetForegroundWindow()
> 98454ba paaudio: send recorded data in smaller chunks
> 2f94e48 paaudio: limit minreq to 75% of audio timer_rate
> 4fd4d92 paaudio: comment bugs in functions qpa_init_*
> 1045ac7 paaudio: remove unneeded code
> d5c8eb1 paaudio: wait until the playback stream is ready
> 11d1092 paaudio: wait for PA_STREAM_READY in qpa_write()
> 6cc0dee paaudio: avoid to clip samples multiple times
> d670342 audio: remove remaining unused plive code
> 0cc736d sdlaudio: enable (in|out).mixing-engine=off
> 61543ec audio: break generic buffer dependency on mixing-engine
> 330dfbe sdlaudio: add recording functions
> 998b92f audio: split pcm_ops function get_buffer_in
> bc84416 sdlaudio: replace legacy functions with modern ones
> 8f33798 sdlaudio: fill remaining sample buffer with silence
> 78c2474 sdlaudio: always clear the sample buffer
> f5ea854 sdlaudio: don't start playback in init routine
> 7a1a2df sdlaudio: add -audiodev sdl,out.buffer-count option
> 6aa7760 audio: fix bit-rotted code
> 98cf04b sdlaudio: remove leftover SDL1.2 code
>
> === OUTPUT BEGIN ===
> 1/23 Checking commit 98cf04b7c44a (sdlaudio: remove leftover SDL1.2 code)
> 2/23 Checking commit 6aa776039e75 (audio: fix bit-rotted code)
> 3/23 Checking commit 7a1a2df1c97f (sdlaudio: add -audiodev sdl,out.buffer-count option)
> 4/23 Checking commit f5ea85493feb (sdlaudio: don't start playback in init routine)
> 5/23 Checking commit 78c2474549af (sdlaudio: always clear the sample buffer)
> 6/23 Checking commit 8f33798c4ff8 (sdlaudio: fill remaining sample buffer with silence)
> 7/23 Checking commit bc844166b227 (sdlaudio: replace legacy functions with modern ones)
> ERROR: spaces required around that '*' (ctx:WxV)
> #133: FILE: audio/sdlaudio.c:247:
> +        glue(SDLVoice, dir) *sdl = (glue(SDLVoice, dir) *)hw;  \
>                              ^
>
> ERROR: spaces required around that '*' (ctx:WxB)
> #133: FILE: audio/sdlaudio.c:247:
> +        glue(SDLVoice, dir) *sdl = (glue(SDLVoice, dir) *)hw;  \
>                                                          ^
>
> total: 2 errors, 0 warnings, 222 lines checked
>
> Patch 7/23 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>
> 8/23 Checking commit 998b92fd32ff (audio: split pcm_ops function get_buffer_in)
> 9/23 Checking commit 330dfbed90b4 (sdlaudio: add recording functions)
> ERROR: spaces required around that '*' (ctx:WxV)
> #86: FILE: audio/sdlaudio.c:306:
> +        glue(SDLVoice, dir) *sdl = (glue(SDLVoice, dir) *)hw;  \
>                              ^
>
> ERROR: spaces required around that '*' (ctx:WxB)
> #86: FILE: audio/sdlaudio.c:306:
> +        glue(SDLVoice, dir) *sdl = (glue(SDLVoice, dir) *)hw;  \
>                                                          ^
>
> total: 2 errors, 0 warnings, 185 lines checked
>
> Patch 9/23 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.

All errors are false positives. The * isn't a multiplication.

>
> 10/23 Checking commit 61543ec830f5 (audio: break generic buffer dependency on mixing-engine)
> 11/23 Checking commit 0cc736d525a7 (sdlaudio: enable (in|out).mixing-engine=off)
> 12/23 Checking commit d6703422e706 (audio: remove remaining unused plive code)
> 13/23 Checking commit 6cc0dee46213 (paaudio: avoid to clip samples multiple times)
> 14/23 Checking commit 11d109269391 (paaudio: wait for PA_STREAM_READY in qpa_write())
> 15/23 Checking commit d5c8eb16d112 (paaudio: wait until the playback stream is ready)
> 16/23 Checking commit 1045ac7440af (paaudio: remove unneeded code)
> 17/23 Checking commit 4fd4d92e5788 (paaudio: comment bugs in functions qpa_init_*)
> 18/23 Checking commit 2f94e489468a (paaudio: limit minreq to 75% of audio timer_rate)
> 19/23 Checking commit 98454ba25082 (paaudio: send recorded data in smaller chunks)
> 20/23 Checking commit 3bf4a8e55ba4 (dsoundaudio: replace GetForegroundWindow())
> 21/23 Checking commit ead5e23b8560 (dsoundaudio: rename dsound_open())
> 22/23 Checking commit 825e3ade19c8 (dsoundaudio: enable f32 audio sample format)
> 23/23 Checking commit f5676b9a646c (dsoundaudio: fix log message)
> === OUTPUT END ===
>
> Test command exited with code: 1
>
>
> The full log is available at
> http://patchew.org/logs/9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com


