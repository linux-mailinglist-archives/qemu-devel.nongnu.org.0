Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA4374F4A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:17:58 +0200 (CEST)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXKf-00071C-DE
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leXId-00060X-Rr
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:15:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leXIa-00049y-UG
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620281746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFkXaa/luFg+snuBp1S9utoluxKnhVpZqu/OumQeH6o=;
 b=YJfCEY9h+qoDupKYlSR9xbCFUW+jfVMU4M8RMCwHgPSnVrPOViqsEboI+VBAtFjy8DxDnn
 fYYOGudvMeUv9L53J3nxjqpcQr/akxjhDrC1YDKS4guSK44g2UNOaptyfPVTyF7xdJMhGY
 jt8oD4IRYGl5tTqHBBAxTx8Uwd0r98w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-B680IWkYOhyIvEt3FFcURg-1; Thu, 06 May 2021 02:15:44 -0400
X-MC-Unique: B680IWkYOhyIvEt3FFcURg-1
Received: by mail-wr1-f72.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so1746805wrc.5
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 23:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fFkXaa/luFg+snuBp1S9utoluxKnhVpZqu/OumQeH6o=;
 b=WgxVkA4nb2/uPRVQ3xAGZoUmfyDYWimbai9o10UwQ9B2yEKK25xDmzNKTeczaOvyV8
 QVcspRrUCwVp8afaVwCVOYf5W9IWGgolgbSZYxyNFH/2MVVGH5x3/jjpqLoC7krh82+x
 QLTXCQQeHPbY61Na3BlK+SIUGbGTpbEWoWRd9/8Ofpco+k9aQyJ9snKKyjovgED86g5D
 yafg3SdUCE9dHYvbWJrRpkQCC1Dw4+Al09cYbuf5M6hReZ2DVfSt8vDTD6K9yMU1GPAh
 s7ZXP0+N3vc1IJBVVO71SVFOgWCnm5SxTwLycfAXQTYf3E0pFDQ8ZQB3FlVVisHGdaxr
 iMNQ==
X-Gm-Message-State: AOAM532iaQeHkJL+YkNHt7VPhkKRdN4IbXRVtQpfhTt66FWtofoXLFJE
 6SMepd8ecJTZc7XstzkmCH9iqDAcgJJADf6iZQQJqne4qiaemSL3s1ZPMzFHvrHaupaHjDEadt6
 TgASv8jZxNXpBIORrgER963n1cIW16NS+O/XhblL7qN0+RVJDlFEw2uiXl5ElwRzF
X-Received: by 2002:a5d:5008:: with SMTP id e8mr2866395wrt.386.1620281743624; 
 Wed, 05 May 2021 23:15:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOnpYw0OmXenkJ1rzqhg9OQFVmuFeqJ5zOuNrY8HSZqWazr+EUCJph8mFP9ECnpn0rNp7RLQ==
X-Received: by 2002:a5d:5008:: with SMTP id e8mr2866375wrt.386.1620281743438; 
 Wed, 05 May 2021 23:15:43 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id x17sm8219026wmc.11.2021.05.05.23.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 23:15:43 -0700 (PDT)
Subject: Re: [PATCH 02/10] ps2: don't raise an interrupt if queue is full
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
 <20210505192133.7480-2-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8ecacd2b-0247-7dc3-5e7f-6c22a77b0975@redhat.com>
Date: Thu, 6 May 2021 08:15:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505192133.7480-2-vr_qemu@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 9:21 PM, Volker Rümelin wrote:
> ps2_queue() behaves differently than the very similar functions
> ps2_queue_2() to ps2_queue_4(). The first one calls update_irq()
> even if the queue is full, the others don't. Change ps2_queue()
> to be consistent with the others.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>  hw/input/ps2.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


