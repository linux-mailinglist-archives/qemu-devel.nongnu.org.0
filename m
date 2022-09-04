Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569D5AC2FE
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 08:29:31 +0200 (CEST)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUj8L-0003Td-TZ
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 02:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oUj3d-0001vS-78
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 02:24:40 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oUj3b-0003FM-2B
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 02:24:36 -0400
Received: by mail-qk1-x733.google.com with SMTP id g21so4582359qka.5
 for <qemu-devel@nongnu.org>; Sat, 03 Sep 2022 23:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=36qiLKl3+4XzCtmhlgiOODuEnB04b55UH5QqIlvc5Nk=;
 b=iQQ2qo9iOX6JpueX3Ls1L9xG4DkQMuUaP5EceQoQ7DBmy58QQAYpS190AbTXpkS8fK
 zZ39fHwlqg6AoFJHtLbdMxqV2BFdEN6/rEx+8M4wsQY2CT9spgvPmaD/pDQsxSi2sbCT
 low+BFaq6I167+CozTQBu2JUAmwPJMHK5bfkjQlA3mSkKYkd4LmBGodXdS4jXMxQRNUK
 x6lyUKRA6Z+UK9SWPF8xwgj6ZYX40LI3F3gKtv+aBVMXhRmqoX1szKiUZeFH44lsyu7M
 f8v4Bzf+eiL68p539P2pfOoaUCFX84RzRtFY3XKukTVycQI+a0dIZQxtmODG814hYh1k
 DPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=36qiLKl3+4XzCtmhlgiOODuEnB04b55UH5QqIlvc5Nk=;
 b=jCx0DU0zYbulNwIH9dq41uVLR/Vbv9pGYEW3W5AsmG2CNGFn6pt0dqOladGWtKxBXI
 PKjsHgYpmBW84+piao6fgWperApr+Vug6/lFcGtLsWE+Jp+spsRi2FQ1TlOJCZj7s+ky
 V4GvrfA+CFzLQTKnKQ/HPOK2IYka3BQpWCTCw1FL0DIcEHSqGmaWUz2QN558D0LCWkzp
 OrpPIPSC93gTMYWPlxkdPl2FC/5FF6GlR+qFmBwzHrSSKQVBrvDn0bZhdiyYitV8cx2g
 y7l8MyJhu24DUsLwksS8kolAVS2vUXxR1Svpsry1Q5uXOXooVISsoS3U7HDIp0FwJOqJ
 WeoQ==
X-Gm-Message-State: ACgBeo0/vMrA7D8aDOxyH0esISmC7xw0dBg/ecm+HTAbAJX43y933kUi
 QYGzRLiD/dojEWeozf9wS8fdLBZtI1mPWPq1Z8U=
X-Google-Smtp-Source: AA6agR48WkYcAnpRo3C325jD4mShDT/jvBMsd9PgxSPD4dJarVKvs67xhG0VFSMzVz4MVYeC+hoiVI+YXXkvfkDFyAs=
X-Received: by 2002:a37:9d6:0:b0:6c7:3c3d:291d with SMTP id
 205-20020a3709d6000000b006c73c3d291dmr523927qkj.132.1662272673907; Sat, 03
 Sep 2022 23:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
 <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
In-Reply-To: <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Sep 2022 14:24:22 +0800
Message-ID: <CAEUhbmV_UU1TpRXfyz5U9kRj5r1ihm-HrXhzw_D-L96_Skxy+g@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Sep 1, 2022 at 8:58 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Aug 24, 2022 at 2:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> Random failure was observed when running qtests on Windows due to
>> "Broken pipe" detected by qmp_fd_receive(). What happened is that
>> the qtest executable sends testing data over a socket to the QEMU
>> under test but no response is received. The errno of the recv()
>> call from the qtest executable indicates ETIMEOUT, due to the qmp
>> chardev's tcp_chr_read() is never called to receive testing data
>> hence no response is sent to the other side.
>>
>> tcp_chr_read() is registered as the callback of the socket watch
>> GSource. The reason of the callback not being called by glib, is
>> that the source check fails to indicate the source is ready. There
>> are two socket watch sources created to monitor the same socket
>> event object from the char-socket backend in update_ioc_handlers().
>>
>> During the source check phase, qio_channel_socket_source_check()
>> calls WSAEnumNetworkEvents() to discovers occurrences of network
>> events for the indicated socket, clear internal network event records,
>> and reset the event object. Testing shows that if we don't reset the
>> event object by not passing the event handle to WSAEnumNetworkEvents()
>> the symptom goes away and qtest runs very stably.
>>
>> It looks we don't need to call WSAEnumNetworkEvents() at all, as we
>> don't parse the result of WSANETWORKEVENTS returned from this API.
>> We use select() to poll the socket status. Fix this instability by
>> dropping the WSAEnumNetworkEvents() call.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
>
> What clears the event then?
>

It seems we don't need to clear the event as everything still works as expe=
cted.

>>
>> ---
>> During the testing, I removed the following codes in update_ioc_handlers=
():
>>
>>     remove_hup_source(s);
>>     s->hup_source =3D qio_channel_create_watch(s->ioc, G_IO_HUP);
>>     g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
>>                           chr, NULL);
>>     g_source_attach(s->hup_source, chr->gcontext);
>>
>> and such change also makes the symptom go away.
>>
>> And if I moved the above codes to the beginning, before the call to
>> io_add_watch_poll(), the symptom also goes away.
>>
>> It seems two sources watching on the same socket event object is
>> the key that leads to the instability. The order of adding a source
>> watch seems to also play a role but I can't explain why.
>> Hopefully a Windows and glib expert could explain this behavior.
>>
>
> Feel free to leave that comment in the commit message.

Sure, will add the above message into the commit in v2.

>
> This is strange, as both sources should have different events, clearing o=
ne shouldn't affect the other.

Both sources have the same event, as one QIO channel only has one
socket, and one socket can only be bound to one event.

>
> I guess it's WSAEnumNetworkEvents clearing of the internal network event =
records that is problematic.
>
> Can you check if you replace the call with ResetEvent() everything works?

No, ResetEvent() does not work, and is not recommended by MSDN [1]
too, which says:

The proper way to reset the state of an event object used with the
WSAEventSelect function is to pass the handle of the event object to
the WSAEnumNetworkEvents function in the hEventObject parameter. This
will reset the event object and adjust the status of active FD events
on the socket in an atomic fashion.

[1] https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2=
-wsaeventselect

>
>
>>
>>  io/channel-watch.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/io/channel-watch.c b/io/channel-watch.c
>> index 89f3c8a88a..e34d86e810 100644
>> --- a/io/channel-watch.c
>> +++ b/io/channel-watch.c
>> @@ -115,17 +115,13 @@ static gboolean
>>  qio_channel_socket_source_check(GSource *source)
>>  {
>>      static struct timeval tv0;
>> -
>>      QIOChannelSocketSource *ssource =3D (QIOChannelSocketSource *)sourc=
e;
>> -    WSANETWORKEVENTS ev;
>>      fd_set rfds, wfds, xfds;
>>
>>      if (!ssource->condition) {
>>          return 0;
>>      }
>>
>> -    WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &ev);
>> -
>>      FD_ZERO(&rfds);
>>      FD_ZERO(&wfds);
>>      FD_ZERO(&xfds);
>
>
> Unrelated, after this chunk, there is
>         FD_SET((SOCKET)ssource->socket, &rfds);
>
> it seems we can drop the cast. Feel free to send another patch.
>

Yeah, this cast is unnecessary. Will spin a new patch in v2. Thanks!

Regards,
Bin

