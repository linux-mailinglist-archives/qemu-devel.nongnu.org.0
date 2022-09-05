Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5BD5ACA68
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 08:18:05 +0200 (CEST)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV5Qp-0002Od-Rh
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 02:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oV5Mx-0000Y4-KV
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 02:14:04 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oV5Ms-0001mY-P7
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 02:14:03 -0400
Received: by mail-qt1-x830.google.com with SMTP id j17so5504749qtp.12
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 23:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=SaEFT1vdradqPAdNuet0OG0vE12HuDbzQ/z5s3vxMpc=;
 b=QvelryeEx+oj6BLuenkA8TBcBIIhf2T4UhFQcHZM3xPaFrFhzoV2N/v9paijDDHbWq
 o5n91ltLrE+LYbW4Zrc8GUqa5nAp29cRi6Kzl07ESuYxWYcXTM/hWnjsJ25h7isoXsiI
 3GUVNPm79LFer1UH85MJNFnnJ6Vr7324Y+VCz0D9GW5aT723cGvb2Z/JniVpdrVP+8eE
 tq9nhX79YaD7/Ltc/Dqcwr7eSfNzx3hY5w4Zua2uyEWZlXkspJXGuD+GY7fpD75oTzf1
 5WaCb64/0Gy6zAUlLWaqaNDhq9g4N6gyzdKuwhtq9oSITXrVwTluUya/iM8NyPD5qts7
 kMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SaEFT1vdradqPAdNuet0OG0vE12HuDbzQ/z5s3vxMpc=;
 b=VaIA6kT6prOjVzW5syfcCIQPokPKJQVoeEEgXETJILcmBxJ1tG3hFFY3ftpagjCH2M
 0fxHT9+ab2MNy7G63Sy+nNUAvgZ3Ph0n3TbJu1lOo30gnqOrsK5pnEBOUo6Ttwt76z7f
 V+iHoe2PepDkdVxCdZRdr744d74eT1o7fh8dC8F0OVh+qWk9xWS2MPDB0ZUrgEHM2OQl
 HDRNsf85NsKfHCNmcoigzeowZxJWAXfY4kLstv4vmjtEMgHkOcprF6J+gJ6CvpGLN8gW
 i7EeywMYUXQ8PYIF+qJNIawqZM2P7jCyNBj+3AzF7RLZDfN8+i3Kzv4sM7LWUWJ0twuJ
 Ph+w==
X-Gm-Message-State: ACgBeo27eLydYK3hajpHHPgIEzmanoGIv5MKPP5HbC2M6aYU592F0oLF
 tl3q6YFWViHpKrKvR7+Jp+0J1aodX6u+TcKsTzA=
X-Google-Smtp-Source: AA6agR4kUy9Qt/dWxGPHoGsQLAomzgq9fnulQdDbyeitJ6uPGETjYfusuA+B4svXeTN+CPpWyOETxfnTKH/87yzwDsM=
X-Received: by 2002:ac8:5b0d:0:b0:344:8ba5:420b with SMTP id
 m13-20020ac85b0d000000b003448ba5420bmr39265414qtw.391.1662358436092; Sun, 04
 Sep 2022 23:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-50-bmeng.cn@gmail.com>
 <CAJ+F1C+-4U1huf=Jv_uJP-XXnXu88Gj9HHvrGS0dTFyKGv=qBg@mail.gmail.com>
 <CAEUhbmV_UU1TpRXfyz5U9kRj5r1ihm-HrXhzw_D-L96_Skxy+g@mail.gmail.com>
 <CAJ+F1CJo-0isj2LKdabMHu854e7kukwjp=CCejgk_TzLRwtA3w@mail.gmail.com>
In-Reply-To: <CAJ+F1CJo-0isj2LKdabMHu854e7kukwjp=CCejgk_TzLRwtA3w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Sep 2022 14:13:45 +0800
Message-ID: <CAEUhbmXjHCEOy+U3zABsvCU20rDj5pogNVTUCUEevdrqhcjuoA@mail.gmail.com>
Subject: Re: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x830.google.com
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

On Mon, Sep 5, 2022 at 2:04 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Sun, Sep 4, 2022 at 10:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Thu, Sep 1, 2022 at 8:58 PM Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@gmail.com> wrote:
>> >
>> > Hi
>> >
>> > On Wed, Aug 24, 2022 at 2:49 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >>
>> >> From: Bin Meng <bin.meng@windriver.com>
>> >>
>> >> Random failure was observed when running qtests on Windows due to
>> >> "Broken pipe" detected by qmp_fd_receive(). What happened is that
>> >> the qtest executable sends testing data over a socket to the QEMU
>> >> under test but no response is received. The errno of the recv()
>> >> call from the qtest executable indicates ETIMEOUT, due to the qmp
>> >> chardev's tcp_chr_read() is never called to receive testing data
>> >> hence no response is sent to the other side.
>> >>
>> >> tcp_chr_read() is registered as the callback of the socket watch
>> >> GSource. The reason of the callback not being called by glib, is
>> >> that the source check fails to indicate the source is ready. There
>> >> are two socket watch sources created to monitor the same socket
>> >> event object from the char-socket backend in update_ioc_handlers().
>> >>
>> >> During the source check phase, qio_channel_socket_source_check()
>> >> calls WSAEnumNetworkEvents() to discovers occurrences of network
>> >> events for the indicated socket, clear internal network event records=
,
>> >> and reset the event object. Testing shows that if we don't reset the
>> >> event object by not passing the event handle to WSAEnumNetworkEvents(=
)
>> >> the symptom goes away and qtest runs very stably.
>> >>
>> >> It looks we don't need to call WSAEnumNetworkEvents() at all, as we
>> >> don't parse the result of WSANETWORKEVENTS returned from this API.
>> >> We use select() to poll the socket status. Fix this instability by
>> >> dropping the WSAEnumNetworkEvents() call.
>> >>
>> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> >
>> >
>> > What clears the event then?
>> >
>>
>> It seems we don't need to clear the event as everything still works as e=
xpected.
>
>
> Well, it can "work" but are you sure it doesn't have a busy loop?

You mean busy loop in g_poll()?

>> >>
>> >> ---
>> >> During the testing, I removed the following codes in update_ioc_handl=
ers():
>> >>
>> >>     remove_hup_source(s);
>> >>     s->hup_source =3D qio_channel_create_watch(s->ioc, G_IO_HUP);
>> >>     g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
>> >>                           chr, NULL);
>> >>     g_source_attach(s->hup_source, chr->gcontext);
>> >>
>> >> and such change also makes the symptom go away.
>> >>
>> >> And if I moved the above codes to the beginning, before the call to
>> >> io_add_watch_poll(), the symptom also goes away.
>> >>
>> >> It seems two sources watching on the same socket event object is
>> >> the key that leads to the instability. The order of adding a source
>> >> watch seems to also play a role but I can't explain why.
>> >> Hopefully a Windows and glib expert could explain this behavior.
>> >>
>> >
>> > Feel free to leave that comment in the commit message.
>>
>> Sure, will add the above message into the commit in v2.
>>
>> >
>> > This is strange, as both sources should have different events, clearin=
g one shouldn't affect the other.
>>
>> Both sources have the same event, as one QIO channel only has one
>> socket, and one socket can only be bound to one event.
>
>
>  "one socket can only be bound to one event", is that a WSAEventSelect li=
mitation?
>

Yes, please see the MSDN:

It is not possible to specify different event objects for different
network events. The following code will not work; the second call will
cancel the effects of the first, and only the FD_WRITE network event
will be associated with hEventObject2:

rc =3D WSAEventSelect(s, hEventObject1, FD_READ);
rc =3D WSAEventSelect(s, hEventObject2, FD_WRITE); //bad

>>
>> >
>> > I guess it's WSAEnumNetworkEvents clearing of the internal network eve=
nt records that is problematic.
>> >
>> > Can you check if you replace the call with ResetEvent() everything wor=
ks?
>>
>> No, ResetEvent() does not work, and is not recommended by MSDN [1]
>> too, which says:
>
>
> It probably works to some extent (I see glib is using it https://gitlab.g=
nome.org/GNOME/glib/-/blob/main/glib/giowin32.c#L903), What you mean is tha=
t it doesn't solve the issue, I guess.

Correct, it does not solve the issue.

>>
>>
>> The proper way to reset the state of an event object used with the
>> WSAEventSelect function is to pass the handle of the event object to
>> the WSAEnumNetworkEvents function in the hEventObject parameter. This
>> will reset the event object and adjust the status of active FD events
>> on the socket in an atomic fashion.
>>
>
> This is not what you want though if you have multiple event objects for t=
he same socket.
>
>>
>> [1] https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winso=
ck2-wsaeventselect

Regards,
Bin

