Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D6C481DF5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 17:09:14 +0100 (CET)
Received: from localhost ([::1]:53734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2xzN-0002LU-7S
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 11:09:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xxt-0000l0-Lv
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 11:07:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2xxr-0004aC-S5
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 11:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640880459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yX/pvSgj4F0NpydsSkEKwkLZ2HI2cTP2y1vAkSFiFbU=;
 b=KI7Ce0IAu7iJWawLF1/qE0+G10QqDda7myKn0GWh8iaDrZgcjB3+2TozS27dISBibWl4OT
 5OrjqYjLhmf6rR/h5y48qEFr0I4ismAYlD2U42d5p7cRQFVHHjWpoBY2WUWAGxkngOaF0l
 zIsDqpvnvL4XP6w8Ii+SBB82ZoPGi4w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-Hg5R1HlIOlqxj4bQglKwGw-1; Thu, 30 Dec 2021 11:07:38 -0500
X-MC-Unique: Hg5R1HlIOlqxj4bQglKwGw-1
Received: by mail-wr1-f69.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so5080490wrh.23
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 08:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yX/pvSgj4F0NpydsSkEKwkLZ2HI2cTP2y1vAkSFiFbU=;
 b=Tj46yyoQ/1cQh0KBPwgE0pD/V0Ju0NU5mgJZNzBN2z3rTSnjibh4izKne4btI9xVJy
 RiQTbSXsTd/XyMczEWWFMppXo68qhkmcse4A2p0KhsT2h7U0GBrBbRrfXWjv8XlclZ2u
 WjkWSUVXZqpj/1xG2PAedUkriZN5SOJ1gizVhPTy2xrW0ByKT4MT/MVQ+k3TehXLbwOv
 OzTM6MS8SXHd3XX4ednH5dM6+v7b1K/35sQHOPgev+zi1d5bHsrxh+2JCl2sot590W9k
 vzrzgKZ4MiL1m1dggp6ejRIco88HykkcgEu4sno/iOf8WKzSKXX1dxb5DjAa8+Am1/oO
 0S3Q==
X-Gm-Message-State: AOAM5330d5gdngqLnjSvrnlqiwYcKdwyj8Q/DgQIfPZQ1oMebPEBlMRh
 uN1VK5dL0PpoH4s6/qeIAYwIldJL1OtiJIwiViCSVjqQiitDzHEgnWab3WhXDd2Oc+z3b1I4bz8
 pwaZGTSMDbcgbNsjPpK+Pz/3fEamh6NsQLzLUWy9CTFqGfy2v8Xo+eJc1qVi2RFvY
X-Received: by 2002:a05:600c:4e4b:: with SMTP id
 e11mr26423372wmq.28.1640880456527; 
 Thu, 30 Dec 2021 08:07:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcez3N3OgnPIasr4D7X1914KUavu6ASdwFzucJ+TJzxwR86fN48/lRYOui745OZrtyUxNbgg==
X-Received: by 2002:a05:600c:4e4b:: with SMTP id
 e11mr26423317wmq.28.1640880456225; 
 Thu, 30 Dec 2021 08:07:36 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id h3sm24458082wrt.94.2021.12.30.08.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 08:07:35 -0800 (PST)
Message-ID: <60d8426a-b2fe-08e7-5ab6-ee73dcd114cc@redhat.com>
Date: Thu, 30 Dec 2021 17:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 00/23] hw: Have DMA APIs take MemTxAttrs arg &
 propagate MemTxResult (full)
To: qemu-devel@nongnu.org
References: <20211223115554.3155328-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 12:55, Philippe Mathieu-Daudé wrote:
> Hi Peter and Paolo.
> 
> This series contains all the uncontroversary patches from
> the "improve DMA situations, avoid re-entrancy issues"
> earlier series. The rest will be discussed on top.
> 
> The only operations added are:
> - take MemTxAttrs argument
> - propagate MemTxResult

Series queued.


