Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14FC140B5C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 14:48:13 +0100 (CET)
Received: from localhost ([::1]:57572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isRyu-00012C-Ii
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 08:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isRu7-0005jh-Vu
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:43:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isRu6-0006vM-Rn
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:43:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22149
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isRu6-0006u0-OA
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:43:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579268593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XLT60pF5ceWltFSTznm0nEFT2CDklKayKYDBwxDBlHw=;
 b=JcbzSgKISJUtowaDdKxHHpU2rQFGFu5MKgxZ17vJMPTfUpa+QRDrDqKyUfOMvotD7XbUl+
 90xe8JjzrBzvEJQTaEIxWW4PcP33Jtz0jkFIGgcSLRHzrraeltUpDyVUX7t3psSeLNSj3P
 5U3HOv6vltbMOzaAAF8zrllmaKpYfhs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-oceR1C56NIybDc_L2Ecx4w-1; Fri, 17 Jan 2020 08:43:12 -0500
Received: by mail-wr1-f71.google.com with SMTP id i9so10536976wru.1
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 05:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d5Oz69Cb3gs8qrJD23OzNOutCE7KFa7jd3ApfXMTIqg=;
 b=T43jPBbF2wJXnuWWDG7glRgHWbVnDn2PuyWBe4zM8veMnvjVyCMuIEjjMmR9PLtJXu
 2R55srgEmegWN6yewgMJyT3Fu4EqEXQnyOKEgSsfIpCMzabfH4lM5AnEhQR2qIrR931b
 7NFZY3oyR3OAPrg/CmkcQPkBWZqwlrTiC/yicmtrAaLNQIJgJ/6Q0crCeqz9sEXkOJSg
 WuHuubLEAArExrqaB+k5a2SUucIniyjC7H2Nyvz8XF/KY7WXhRXNsW5FzKZGbhpsol1U
 /Qjx5OIo+Rt5PdzatyJEYz2gOQ9IyiDNIOVd3Q9X2JmJUdKxp4i5ZaxtX9vS5xG1CGNq
 QN6Q==
X-Gm-Message-State: APjAAAWsWtfng9FQIKG+xuBGudj9Ddk/7RF5C8T8jk2FmDiis7VIk0Tu
 QcN5BuXsEGfSzO/UV1l+aohBc6S4bTFjE376OhIKr1s98K8hXAoca0mEdtAJ/45FGoXMbrnRx9C
 VoDNWaP1/UjOB5BU=
X-Received: by 2002:a7b:cc6a:: with SMTP id n10mr4670521wmj.170.1579268590816; 
 Fri, 17 Jan 2020 05:43:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxGq3nkNeF5qVy8eSAQafX4dotX3TajT8qmbHDDXuxUPEJxbAN01MYU7q9LEndNoGbKqrHKA==
X-Received: by 2002:a7b:cc6a:: with SMTP id n10mr4670498wmj.170.1579268590622; 
 Fri, 17 Jan 2020 05:43:10 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id o15sm34545861wra.83.2020.01.17.05.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2020 05:43:10 -0800 (PST)
Subject: Re: [PATCH 102/104] virtiofsd: fix lo_destroy() resource leaks
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-103-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b28f876f-95ea-278d-c42d-2674ca15029a@redhat.com>
Date: Fri, 17 Jan 2020 14:43:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-103-dgilbert@redhat.com>
Content-Language: en-US
X-MC-Unique: oceR1C56NIybDc_L2Ecx4w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

On 12/12/19 5:39 PM, Dr. David Alan Gilbert (git) wrote:
> From: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Now that lo_destroy() is serialized we can call unref_inode() so that
> all inode resources are freed.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   tools/virtiofsd/passthrough_ll.c | 41 ++++++++++++++++----------------
>   1 file changed, 20 insertions(+), 21 deletions(-)
>=20
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrou=
gh_ll.c
> index 1bf251a91d..38f4948e61 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -1355,26 +1355,6 @@ static void unref_inode_lolocked(struct lo_data *l=
o, struct lo_inode *inode,
>       }
>   }
>  =20
> -static int unref_all_inodes_cb(gpointer key, gpointer value, gpointer us=
er_data)
> -{
> -    struct lo_inode *inode =3D value;
> -    struct lo_data *lo =3D user_data;
> -
> -    inode->nlookup =3D 0;
> -    lo_map_remove(&lo->ino_map, inode->fuse_ino);
> -    close(inode->fd);
> -    lo_inode_put(lo, &inode); /* Drop our refcount from lo_do_lookup() *=
/
> -
> -    return TRUE;
> -}
> -
> -static void unref_all_inodes(struct lo_data *lo)
> -{
> -    pthread_mutex_lock(&lo->mutex);
> -    g_hash_table_foreach_remove(lo->inodes, unref_all_inodes_cb, lo);
> -    pthread_mutex_unlock(&lo->mutex);
> -}
> -
>   static void lo_forget_one(fuse_req_t req, fuse_ino_t ino, uint64_t nloo=
kup)
>   {
>       struct lo_data *lo =3D lo_data(req);
> @@ -2460,7 +2440,26 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t in=
o, off_t off, int whence,
>   static void lo_destroy(void *userdata)
>   {
>       struct lo_data *lo =3D (struct lo_data *)userdata;
> -    unref_all_inodes(lo);
> +
> +    /*
> +     * Normally lo->mutex must be taken when traversing lo->inodes but
> +     * lo_destroy() is a serialized request so no races are possible her=
e.
> +     *
> +     * In addition, we cannot acquire lo->mutex since unref_inode() take=
s it
> +     * too and this would result in a recursive lock.
> +     */
> +    while (true) {
> +        GHashTableIter iter;
> +        gpointer key, value;
> +
> +        g_hash_table_iter_init(&iter, lo->inodes);
> +        if (!g_hash_table_iter_next(&iter, &key, &value)) {
> +            break;
> +        }
> +
> +        struct lo_inode *inode =3D value;
> +        unref_inode_lolocked(lo, inode, inode->nlookup);
> +    }
>   }
>  =20
>   static struct fuse_lowlevel_ops lo_oper =3D {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


