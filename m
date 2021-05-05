Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09E373C04
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:09:28 +0200 (CEST)
Received: from localhost ([::1]:56818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHHL-0004xd-Vf
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leH80-0002hN-Nj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:59:48 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leH7y-0004YE-Kp
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:59:48 -0400
Received: by mail-ej1-x632.google.com with SMTP id t4so2765697ejo.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vHRUFMwSmFPA0wqpLss3UXd6I99bySfcIyqGdHXMRS0=;
 b=lmsbjP5qCLKV/mXxubv2Uqd73uiRXfdjufHa66I7LepJ8WqPqkc2OfHW2WElP5KjlI
 IZ2BdSLNz1M9NRnxwgpCyq0INKzCPGBJWmAbTULeTTUipP9W8B5XbMeMgyimtpLZn4+B
 LJ50SsxyrzNxo/71CJTm27LzTY9V26bive7fk6XWQBZQ4o0ygssnv7ZocLHxvGMItyOs
 d9dG155Jy6X4Bb8kPJwTBnHf3e1YgM48pOGvlz+H36YeLvJ6nhpO0Np9AgVMP7Z9PPAN
 N7odcX8VongwAL2l1sagtRQXnFYW76tRic8qsPJydPhBc0PSChAeLRBVhtOkikrHydA2
 lBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vHRUFMwSmFPA0wqpLss3UXd6I99bySfcIyqGdHXMRS0=;
 b=d7MHmDLnoSw6vAAYpUELFYY39wQ21OYtolGd66m0vzC5qtSSZ8xlc5hMVxqiP4z6QO
 RndPmRGnPuUg05iWYqplenGaJkBngmgq0Q/w/Uds6AeNGYQKdBgFTLXR6NaH07JktZj/
 4DmqJuTHSRZsDnyjJpw0O4KklkDs2qwn5eaHP0RoWZZv/SsFOOfONR+Du3T1M917hwIG
 aau/acwwTI0YqfuYwwApuLeBBjLRYI5O4CDKn6VCjeWNnF/hVij5IAg5VCIgQHrXK1+6
 ljUG14wHcKl6furqquLrQzj5ENLoV1Z/Qb0hVCtS1JSAixZcdoZLM+SSgazFReN/z8f0
 FSXQ==
X-Gm-Message-State: AOAM533qnmA9jYCkXGmKR/OJqg5bLaGi2I4Cm986i31Ti4r5tPbVdKD2
 9HGijixG8F19+gF7sly9DEs0rG/C95Xg7zcht2I=
X-Google-Smtp-Source: ABdhPJy9yYDRwME8M9PPkX+zw85kzdK/lHQUpRl31lXEOPGyzRdDO67o4DuEB6Pz32ZGE461JgHitKrhAxM8AhADsU8=
X-Received: by 2002:a17:906:46d0:: with SMTP id
 k16mr27568194ejs.105.1620219581381; 
 Wed, 05 May 2021 05:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <YJKRUp8E+J7OSCgg@work-vm>
In-Reply-To: <YJKRUp8E+J7OSCgg@work-vm>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 5 May 2021 16:59:28 +0400
Message-ID: <CAJ+F1CLZedsd4X9x5iLoaNNUXSqvet-AKOb-LNsuBjkqfnB3vg@mail.gmail.com>
Subject: Re: vhost-user payload union restrictions ?
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009b416f05c194c4a8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 vgoyal@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009b416f05c194c4a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 5, 2021 at 4:38 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> (Resend, remembering to add list)
> Hi,
>   I'm trying to understand what restrictions there are on the
> payload that's part of VhostUserMsg; and am confused by
> inconsistencies.
>
> Lets start with this version:
>
> subprojects/libvhost-user/libvhost-user.h :
> typedef struct VhostUserMsg {
>     int request;
>
> #define VHOST_USER_VERSION_MASK     (0x3)
> #define VHOST_USER_REPLY_MASK       (0x1 << 2)
> #define VHOST_USER_NEED_REPLY_MASK  (0x1 << 3)
>     uint32_t flags;
>     uint32_t size; /* the following payload size */
>
>     union {
> #define VHOST_USER_VRING_IDX_MASK   (0xff)
> #define VHOST_USER_VRING_NOFD_MASK  (0x1 << 8)
>         uint64_t u64;
>         struct vhost_vring_state state;
>         struct vhost_vring_addr addr;
>         VhostUserMemory memory;
>         VhostUserMemRegMsg memreg;
>         VhostUserLog log;
>         VhostUserConfig config;
>         VhostUserVringArea area;
>         VhostUserInflight inflight;
>     } payload;
>
>     int fds[VHOST_MEMORY_BASELINE_NREGIONS];
>     int fd_num;
>     uint8_t *data;
> } VU_PACKED VhostUserMsg;
>
> note the 'fds' array after the payload but before
> the end of the structure.
>
> But then there's the version in:
> hw/virtio/vhost-user.c
> typedef union {
> #define VHOST_USER_VRING_IDX_MASK   (0xff)
> #define VHOST_USER_VRING_NOFD_MASK  (0x1<<8)
>         uint64_t u64;
>         struct vhost_vring_state state;
>         struct vhost_vring_addr addr;
>         VhostUserMemory memory;
>         VhostUserMemRegMsg mem_reg;
>         VhostUserLog log;
>         struct vhost_iotlb_msg iotlb;
>         VhostUserConfig config;
>         VhostUserCryptoSession session;
>         VhostUserVringArea area;
>         VhostUserInflight inflight;
> } VhostUserPayload;
>
> typedef struct VhostUserMsg {
>     VhostUserHeader hdr;
>     VhostUserPayload payload;
> } QEMU_PACKED VhostUserMsg;
>
> which hasn't got the 'fds' section.
> Yet they're both marked as 'packed'.
>

They are packed, because both are used to serialize/deserialize the stream.


> That's a bit unfortunate for two structures with the same name.
>
>
Yes, maybe it's time to have a canonical system header used by both?


> Am I right in thinking that the vhost-user.c version is sent over
> the wire, while the libvhost-user.h one is really just an interface?
>
>
I believe the extra fields are not used for serializing the message, but
just a convenient way to group related data.


> Is it safe for me to add a new, larger entry in the payload union
> without breaking existing clients?
>

It should be.


> I ended up at this question after trying to add a variable length
> entry to the union:
>
> typedef struct {
>     VhostUserFSSlaveMsg fs;
>     VhostUserFSSlaveMsgEntry entries[VHOST_USER_FS_SLAVE_MAX_ENTRIES];
> } QEMU_PACKED VhostUserFSSlaveMsgMax;
>
> ...
> union ....
>         VhostUserFSSlaveMsg fs;
>         VhostUserFSSlaveMsgMax fs_max; /* Never actually used */
> } VhostUserPayload;
>
> and in the .h I had:
> typedef struct {
>     /* Generic flags for the overall message */
>     uint32_t flags;
>     /* Number of entries */
>     uint16_t count;
>     /* Spare */
>     uint16_t align;
>
>     VhostUserFSSlaveMsgEntry entries[];
> } VhostUserFSSlaveMsg;
>
>     union {
> ...
>         VhostUserInflight inflight;
>         VhostUserFSSlaveMsg fs;
>     } payload;
>
> which is apparently OK in the .c version, and gcc is happy with the same
> in the libvhost-user.h version; but clang gets upset by the .h
> version because it doesn't like the variable length structure
> before the end of the struct - which I have sympathy for.
>
>
Indeed, we probably want to allocate the message separately then.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009b416f05c194c4a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 4:38 PM Dr. =
David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">(Resend, remembering to add list)<br>
Hi,<br>
=C2=A0 I&#39;m trying to understand what restrictions there are on the<br>
payload that&#39;s part of VhostUserMsg; and am confused by<br>
inconsistencies.<br>
<br>
Lets start with this version:<br>
<br>
subprojects/libvhost-user/libvhost-user.h :<br>
typedef struct VhostUserMsg {<br>
=C2=A0 =C2=A0 int request;<br>
<br>
#define VHOST_USER_VERSION_MASK=C2=A0 =C2=A0 =C2=A0(0x3)<br>
#define VHOST_USER_REPLY_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 2)<br=
>
#define VHOST_USER_NEED_REPLY_MASK=C2=A0 (0x1 &lt;&lt; 3)<br>
=C2=A0 =C2=A0 uint32_t flags;<br>
=C2=A0 =C2=A0 uint32_t size; /* the following payload size */<br>
<br>
=C2=A0 =C2=A0 union {<br>
#define VHOST_USER_VRING_IDX_MASK=C2=A0 =C2=A0(0xff)<br>
#define VHOST_USER_VRING_NOFD_MASK=C2=A0 (0x1 &lt;&lt; 8)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t u64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vhost_vring_state state;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vhost_vring_addr addr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserMemory memory;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserMemRegMsg memreg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserLog log;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserConfig config;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserVringArea area;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserInflight inflight;<br>
=C2=A0 =C2=A0 } payload;<br>
<br>
=C2=A0 =C2=A0 int fds[VHOST_MEMORY_BASELINE_NREGIONS];<br>
=C2=A0 =C2=A0 int fd_num;<br>
=C2=A0 =C2=A0 uint8_t *data;<br>
} VU_PACKED VhostUserMsg;<br>
<br>
note the &#39;fds&#39; array after the payload but before<br>
the end of the structure.<br>
<br>
But then there&#39;s the version in:<br>
hw/virtio/vhost-user.c<br>
typedef union {<br>
#define VHOST_USER_VRING_IDX_MASK=C2=A0 =C2=A0(0xff)<br>
#define VHOST_USER_VRING_NOFD_MASK=C2=A0 (0x1&lt;&lt;8)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t u64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vhost_vring_state state;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vhost_vring_addr addr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserMemory memory;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserMemRegMsg mem_reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserLog log;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vhost_iotlb_msg iotlb;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserConfig config;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserCryptoSession session;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserVringArea area;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserInflight inflight;<br>
} VhostUserPayload;<br>
<br>
typedef struct VhostUserMsg {<br>
=C2=A0 =C2=A0 VhostUserHeader hdr;<br>
=C2=A0 =C2=A0 VhostUserPayload payload;<br>
} QEMU_PACKED VhostUserMsg;<br>
<br>
which hasn&#39;t got the &#39;fds&#39; section.<br>
Yet they&#39;re both marked as &#39;packed&#39;.<br></blockquote><div><br><=
/div><div>They are packed, because both are used to serialize/deserialize t=
he stream.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
That&#39;s a bit unfortunate for two structures with the same name.<br>
<br></blockquote><div><br></div><div>Yes, maybe it&#39;s time to have a can=
onical system header used by both?<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Am I right in thinking that the vhost-user.c version is sent over<br>
the wire, while the libvhost-user.h one is really just an interface?<br>
<br></blockquote><div><br></div><div>I believe the extra fields are not use=
d for serializing the message, but just a convenient way to group related d=
ata.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
Is it safe for me to add a new, larger entry in the payload union<br>
without breaking existing clients?<br></blockquote><div><br></div><div>It s=
hould be.</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
I ended up at this question after trying to add a variable length<br>
entry to the union:<br>
<br>
typedef struct {<br>
=C2=A0 =C2=A0 VhostUserFSSlaveMsg fs;<br>
=C2=A0 =C2=A0 VhostUserFSSlaveMsgEntry entries[VHOST_USER_FS_SLAVE_MAX_ENTR=
IES];<br>
} QEMU_PACKED VhostUserFSSlaveMsgMax;<br>
<br>
...<br>
union ....<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserFSSlaveMsg fs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserFSSlaveMsgMax fs_max; /* Never actuall=
y used */<br>
} VhostUserPayload;<br>
<br>
and in the .h I had:<br>
typedef struct {<br>
=C2=A0 =C2=A0 /* Generic flags for the overall message */<br>
=C2=A0 =C2=A0 uint32_t flags;<br>
=C2=A0 =C2=A0 /* Number of entries */<br>
=C2=A0 =C2=A0 uint16_t count;<br>
=C2=A0 =C2=A0 /* Spare */<br>
=C2=A0 =C2=A0 uint16_t align;<br>
<br>
=C2=A0 =C2=A0 VhostUserFSSlaveMsgEntry entries[];<br>
} VhostUserFSSlaveMsg;<br>
<br>
=C2=A0 =C2=A0 union {<br>
...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserInflight inflight;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 VhostUserFSSlaveMsg fs;<br>
=C2=A0 =C2=A0 } payload;<br>
<br>
which is apparently OK in the .c version, and gcc is happy with the same<br=
>
in the libvhost-user.h version; but clang gets upset by the .h<br>
version because it doesn&#39;t like the variable length structure<br>
before the end of the struct - which I have sympathy for.<br>
<br></blockquote><div><br></div><div>Indeed, we probably want to allocate t=
he message separately then.<br></div><div>=C2=A0</div><div>thanks<br clear=
=3D"all"></div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">=
Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009b416f05c194c4a8--

