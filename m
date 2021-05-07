Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43683765A2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:55:41 +0200 (CEST)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf016-00080h-Go
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lezyk-000646-VI
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lezyh-0006ZL-Az
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620391990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwqnGq9Y+H/ZPunkbbCpleYM5tjm4wIbXDnVUH29Qq8=;
 b=Pn35+cKi8rKFeMideaHpCJmvRJNm4qpywOTz1OKDqbUm5TCWDf+yVSHo0DmjecCQ0X1bNA
 MRcP1RqwYsNL6aeZnYp4RUO1RFW2FsYkMPq+0aVlcfu5JxBnD6agvN01kTtbYJHKZhxCkT
 IXkoQF9Ir/kNnBiHDPdpYJQ3iFt4R1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-cC28ujQrNROsdK0HFwRx6Q-1; Fri, 07 May 2021 08:53:06 -0400
X-MC-Unique: cC28ujQrNROsdK0HFwRx6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 306011936B61;
 Fri,  7 May 2021 12:53:05 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC7EE60D01;
 Fri,  7 May 2021 12:53:04 +0000 (UTC)
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
 <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <da0b1f8a-669c-3998-c3a3-a4660d6867b8@redhat.com>
Date: Fri, 7 May 2021 07:53:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 2:00 AM, Thomas Huth wrote:

> D'oh! I think I can work-around the problem with a patch like
> this on top:
> 
> diff a/configure b/configure
> --- a/configure
> +++ b/configure
> @@ -1686,6 +1686,11 @@ fi
>  
>  for config in $mak_wilds; do
>      target="$(basename "$config" .mak)"
> +    if [ "$target" = "moxie-softmmu" ]; then
> +        # This is a work-around to make incremental builds pass after
> +        # moxie-softmmu has been removed. It can be removed later.
> +        continue
> +    fi
>      if echo "$target_list_exclude" | grep -vq "$target"; then
>          default_target_list="${default_target_list} $target"
>      fi
> diff a/default-configs/targets/moxie-softmmu.mak
> b/default-configs/targets/moxie-softmmu.mak
> new file mode 100644
> index 0000000000..23fd596b66
> --- /dev/null
> +++ b/default-configs/targets/moxie-softmmu.mak
> @@ -0,0 +1,2 @@
> +# This is just a dummy file to avoid that incremental builds are failing.

s/to avoid that incremental builds are failing/to avoid incremental
build failures/

> +# It can be removed as soon as all builders have been updated.
> 
> Does that look acceptable? If yes, I'll respin my PR with that
> squashed into the moxie patch.
> 
>  Thomas
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


