Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C732355114E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:19:04 +0200 (CEST)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Bgd-0005Jf-Pe
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3Bee-0003rC-RO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3Beb-00008p-Hb
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655709416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/QcCuub8SEMlboqDG5MKYfWzT35QYfCtZK7HzDplqmY=;
 b=gHpiBZ+q/ZZ3fiFXxszZJTO/LyknEhywwBMq71sUMD3TX/38p5PrFlWPopZkEsCVPKGCPc
 iSwuESqaJ1utcD3hrAJVH/OJRoGx53Qb490HTcbuqhyNGgHoEG/Odptzip8d6H047S8KWQ
 S/+CMCxVWEKgYNejpJWcRLBrBGkG8Zs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-Sd8kQVvLPrm8zfBQaJgvdA-1; Mon, 20 Jun 2022 03:16:52 -0400
X-MC-Unique: Sd8kQVvLPrm8zfBQaJgvdA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE2FA80159B;
 Mon, 20 Jun 2022 07:16:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A3F40314B;
 Mon, 20 Jun 2022 07:16:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 69FF321E688E; Mon, 20 Jun 2022 09:16:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Delevoryas <pdel@fb.com>
Cc: <samuel.thibault@ens-lyon.org>,  <jasowang@redhat.com>,
 <eblake@redhat.com>,  <qemu-devel@nongnu.org>
Subject: Re: [PATCH 3/4] slirp: Add mfr-id to -netdev options
References: <20220616010526.1895564-1-pdel@fb.com>
 <20220616010526.1895564-4-pdel@fb.com>
Date: Mon, 20 Jun 2022 09:16:50 +0200
In-Reply-To: <20220616010526.1895564-4-pdel@fb.com> (Peter Delevoryas's
 message of "Wed, 15 Jun 2022 18:05:25 -0700")
Message-ID: <87k09b6bz1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Peter Delevoryas <pdel@fb.com> writes:

> This lets you set the manufacturer's ID for a slirp netdev, which can be
> queried from the guest through the Get Version ID NC-SI command. For
> example, by setting the manufacturer's ID to 0x8119:
>
>     wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
>     qemu-system-arm -machine fby35-bmc \
>         -drive file=fby35.mtd,format=raw,if=mtd -nographic \
>         -netdev user,id=nic,mfr-id=0x8119,hostfwd=::2222-:22 \
>         -net nic,model=ftgmac100,netdev=nic
>     ...
>     username: root
>     password: 0penBmc
>     ...
>     root@bmc-oob:~# ncsi-util 0x15
>     NC-SI Command Response:
>     cmd: GET_VERSION_ID(0x15)
>     Response: COMMAND_COMPLETED(0x0000)  Reason: NO_ERROR(0x0000)
>     Payload length = 40
>
>     20: 0xf1 0xf0 0xf0 0x00
>     24: 0x00 0x00 0x00 0x00
>     28: 0x00 0x00 0x00 0x00
>     32: 0x00 0x00 0x00 0x00
>     36: 0x00 0x00 0x00 0x00
>     40: 0x00 0x00 0x00 0x00
>     44: 0x00 0x00 0x00 0x00
>     48: 0x00 0x00 0x00 0x00
>     52: 0x00 0x00 0x81 0x19
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---

[...]

> diff --git a/qapi/net.json b/qapi/net.json
> index d6f7cfd4d6..efc5cb3fb6 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -167,6 +167,8 @@
>  #
>  # @tftp-server-name: RFC2132 "TFTP server name" string (Since 3.1)
>  #
> +# @mfr-id: Manufacturer ID (Private Enterprise Number: IANA)
> +#

Is 'mfr-id' an established technical term, or an abbreviation you came
up with?  If the latter, please use @manufacturer-id instead.

Documentation is rather terse.  It basically provides a bunch of
keywords you can throw at the search engine of your choice.  Can we cut
out that middle man and point straight to a suitable resource?

>  # Since: 1.2
>  ##
>  { 'struct': 'NetdevUserOptions',
> @@ -192,7 +194,8 @@
>      '*smbserver': 'str',
>      '*hostfwd':   ['String'],
>      '*guestfwd':  ['String'],
> -    '*tftp-server-name': 'str' } }
> +    '*tftp-server-name': 'str',
> +    '*mfr-id': 'uint32' } }
>  
>  ##
>  # @NetdevTapOptions:


