Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6424CFD80
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:57:32 +0100 (CET)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBzX-00072b-Ag
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:57:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nRBfr-0008Fp-OG; Mon, 07 Mar 2022 06:37:12 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:53965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nRBfp-0001DC-Ic; Mon, 07 Mar 2022 06:37:11 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MmUcL-1nr8lm3UTx-00iWid; Mon, 07 Mar 2022 12:37:00 +0100
Message-ID: <fff8d24d-d393-6cfd-209b-f0ccc13aac35@vivier.eu>
Date: Mon, 7 Mar 2022 12:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/5] Replace qemu_gettimeofday() with g_get_real_time()
Content-Language: fr
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220304211618.3715999-1-marcandre.lureau@redhat.com>
 <20220304211618.3715999-5-marcandre.lureau@redhat.com>
 <CAMxuvaz_uCxtL+0e-=AFZsuomNAz6H7Y+6RbdkSzfbxcMSLGrg@mail.gmail.com>
 <960fea17-c5e7-fa6f-c185-8a892998cff7@vivier.eu>
 <CAJ+F1CLd+6Zkyr5MzZjhQN2uLjYMYxOJc3q2et+Stks3TqTw9Q@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAJ+F1CLd+6Zkyr5MzZjhQN2uLjYMYxOJc3q2et+Stks3TqTw9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u0skW9AjQVfGObxI14NfRAYywuV1CkRrxLnZUILei8jz8xFcNh7
 6An6DOCo+BSAEDCEm5vrInBzCGtTc3qq5A93wFVmtmg89UuvnN8XFSfvGHMKYJNPS/LiP6d
 Q+sLSF6eIRzy+kLDtXl6oiQ+wF5bvPL4Nsm7inlt9ykS1wfiWgZJuFe81Erns2v4kReOJu1
 gWSsj3u5yrkQp2DMZdO/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vm7X44WkCLQ=:20uSpSKj5S1numUn9Mgo28
 bUtLw/KVQPAlyOSdBD6g0cf6sjbsliS5Nu3apQIVjR1km30TzrUv/5t3K4t812Cs5xCb6iFPK
 NSmeeCYSb9ESh+AygJeQXFw5iKmLTn7f6bJm4qHLa3zFU8VEJaRvlL9UVrA2ti1rPinB1Jp1d
 GFTachktNHDhh9ZdZhLskFQbdmEWM5aZUSFo54G8s0jXPWIvTAULiXA4wolUzK5gDdPYI5cET
 4a/q6DSFFl6L0HlF6KQIGwxVIKdSVWPZt+pxwx419BLTkQXV0LseH7+QMjsZJ/IXRk1mQRsio
 mDAeEmzVWWO/dubdSFCtUoE/z9TCWwLFvGhdCHH55/IL902vR/zoIPFt814ztmGKtgktHr03D
 ZEkWvkA1oz9N2CeB4qS8XtASKVPsTCCiFKYicN/vPJGwXayIMq+uS/NJbl9Ucyt5+yhRjHo95
 3nWFhC+1wLRuUJ6Mg6DP8grJdbZx2/z5grTi+WNwKu8KgQw9thJdP7xjNluLSgrW7H3mXxp2A
 5fVDAtQfHdEpWNBy1zGUebd8XyHwpdr6iXk/ckK4gKIOE+3KRorY1LURGqkx+/wUaAC18eQ5o
 dqOLzsVtjpHA0+yoPW6gg1jOj9h9d0Ya8SIUS+tb8sOc7Xybmb4zEMXWRLzLUIEbfsvr9Cqqe
 VyOtQTIzkEUzu26G2b207BwI5Ch+Iv6dqOk0CR1YCZQzPh6ZCj0BO3nYmNtV+pjG8Zow=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 qemu-block <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/03/2022 à 11:35, Marc-André Lureau a écrit :
> Hi
> 
> On Mon, Mar 7, 2022 at 2:13 PM Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>> wrote:
> 
>     Le 05/03/2022 à 20:17, Marc-André Lureau a écrit :
>      > On Sat, Mar 5, 2022 at 1:18 AM <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>> wrote:
>      >>
>      >> From: Marc-André Lureau <marcandre.lureau@redhat.com <mailto:marcandre.lureau@redhat.com>>
>      >>
>      >> GLib g_get_real_time() is an alternative to gettimeofday() which allows
>      >> to simplify our code.
>      >>
>      >> For semihosting, a few bits are lost on POSIX host, but this shouldn't
>      >> be a big concern.
>      >>
>      >> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>      >> Reviewed-by: Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>>
>      >> ---
>      >>   blockdev.c                 |  8 ++++----
>      >>   hw/rtc/m41t80.c            |  6 +++---
>      >>   hw/virtio/virtio-balloon.c |  9 +--------
>      >>   qapi/qmp-event.c           | 12 +++++-------
>      >>   qemu-img.c                 |  8 ++++----
>      >>   target/m68k/m68k-semi.c    | 22 ++++++++++------------
>      >>   target/nios2/nios2-semi.c  | 23 ++++++++++-------------
>      >>   7 files changed, 37 insertions(+), 51 deletions(-)
>      >>
>     ...
>      >> index 19d3cd003833..025716b3ec37 100644
>      >> --- a/qapi/qmp-event.c
>      >> +++ b/qapi/qmp-event.c
>      >> @@ -20,15 +20,13 @@
>      >>
>      >>   static void timestamp_put(QDict *qdict)
>      >>   {
>      >> -    int err;
>      >>       QDict *ts;
>      >> -    qemu_timeval tv;
>      >> +    int64_t rt = g_get_real_time();
>      >>
>      >> -    err = qemu_gettimeofday(&tv);
>      >> -    /* Put -1 to indicate failure of getting host time */
>      >> -    ts = qdict_from_jsonf_nofail("{ 'seconds': %lld, 'microseconds': %lld }",
>      >> -                                 err < 0 ? -1LL : (long long)tv.tv_sec,
>      >> -                                 err < 0 ? -1LL : (long long)tv.tv_usec);
>      >> +    ts = qdict_from_jsonf_nofail("{ 'seconds': %" G_GINT64_FORMAT
>      >> +                                 ", 'microseconds': %" G_GINT64_FORMAT "}",
>      >> +                                 rt / G_USEC_PER_SEC,
>      >> +                                 rt % G_USEC_PER_SEC);
>      >
>      > NACK this, fixed in v3
> 
>     Why keeping the %lld is better than moving to %G_GINT64_FORMAT?
> 
> 
> It's not supported by json-parser.c parse_interpolation(). We could address this in a different patch.

Yes, it would be a simple fix: it already supports "%i" and "%ld" but not "%li".

Thanks,
Laurent


