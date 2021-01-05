Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B4D2EB39C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 20:47:39 +0100 (CET)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwsIs-0008DP-0K
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 14:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwsGB-0006vs-DN
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:44:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kwsG9-0006rW-Ph
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609875889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8QbTJuoP3JS4AP3KEBT1SaYOBpxWpi4Q7a5MC42ujM=;
 b=BG9TmC/Z495JA/bNwhZoQK8Q5a7Ayma5bqArtiHeVA+METBVIbz/3uju+SS7hO+Nv2uEm9
 xynKWd0z3+bkteYL45jjyPit0yVcRXG1ThoH6Tts3i5Dkj0LbuF+NwrmOWgO3PUyfGAzJ7
 Cxnaq4d5Juk9akYOUJRE7OjumB8BQEg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-VE-h4vVYNHmt4sImnJLvIA-1; Tue, 05 Jan 2021 14:44:46 -0500
X-MC-Unique: VE-h4vVYNHmt4sImnJLvIA-1
Received: by mail-wr1-f70.google.com with SMTP id w8so269114wrv.18
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 11:44:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y8QbTJuoP3JS4AP3KEBT1SaYOBpxWpi4Q7a5MC42ujM=;
 b=O7WqbG4KYhV63Lxbh3uBr3A0LG5Q4id6/iVBmfyo8HWVKivb7Sp0K/DazSuoi1iThB
 75mQBTfTjt7DUGrSkEiAhderokS2mchkx2QH4EHNiH22h75WGiN8WXErhOqNqR2vvO/w
 ZGFBTzvTuQPpSat3npEauQNAxDYrx3PG8egxsJwpQ75Ylr0wQVkW4n3Gd8N1oQvqeV3A
 Tvrr0BD2LyJbhHBwordx0PnbzpIexTtziAM7sIBDE3MYmhVcVj6cHZV0gZG3211NkKxA
 O1lMjYz8MO48Ff2nULEpZ3NnlKYyXAKuXSSJs+DFPJM92LHLtJyya0FvWR3IagVVjzaD
 9b9g==
X-Gm-Message-State: AOAM531lC02RvdPtjddM6/BlMnmhzjehSiUatXU7S+1FXecaFXaWa9ro
 re8ziq0QpEZBuI56WPNhkTTZ/thjOjfWWUFI2zkcRAnp71ivJwXMP4j6u+BSYkkKbIeoxe1pxqi
 f8k7QoAN87qxuqAE=
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr653440wmi.146.1609875885191; 
 Tue, 05 Jan 2021 11:44:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQDQ/teFFHpN6ZvzFd5AlDV6/KBLrFunWv3WZvbZUQrjDuA3yPhaYg+ALrb6g/YB4b7Qybxg==
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr653432wmi.146.1609875885070; 
 Tue, 05 Jan 2021 11:44:45 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id u9sm232517wmb.32.2021.01.05.11.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 11:44:44 -0800 (PST)
Subject: Re: [PATCH 0/2] tracetool: fix log-stap format
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210105191721.120463-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5bf99569-969f-c800-5eae-f6b40abd3ed8@redhat.com>
Date: Tue, 5 Jan 2021 20:44:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105191721.120463-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/21 8:17 PM, Laurent Vivier wrote:
> The first patch fixes a problem I have introduced in vhost-vdpa
> traces by adding an unsupported format ("%llu").
> 
> The second patch fixes a problem I've seen while I was checking
> the result of the first patch: %PRI formats are not decoded
> correctly and we can end with things like "0x%u" because
> the used format is always the one of the first format of the string.
> 
> Laurent Vivier (2):
>   vhost-vdpa: fix "unsigned long long" error with stap
>   tracetool: fix "PRI" macro decoding
> 
>  hw/virtio/trace-events               | 2 +-
>  hw/virtio/vhost-vdpa.c               | 4 ++--
>  scripts/tracetool/format/log_stap.py | 1 +
>  3 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


