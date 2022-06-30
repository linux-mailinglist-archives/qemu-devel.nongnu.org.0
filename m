Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF62561F8D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 17:44:44 +0200 (CEST)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6wLT-0001Pm-CR
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 11:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o6wKK-0000aE-LH
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:43:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o6wKD-0003Ib-JW
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 11:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656603804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8aM4KHL+JNLyVjQkuhkhF+swAGKZ7EE8BHpxS8CwNjI=;
 b=POjBvf0zlRqKzhGXWg02SE1/ZQjnobmNZjs6zO3CBPauTpwjCN1rhW792lytfpqBU1K/Qe
 7HT9pgiWqXFRPkb0Fdl67NqzEdlkkIsQrpIBF5NlbS/2cy8w3LaVz0FbfqcK8gkdmA692L
 PT3COu4djP25YrRyud5emib+JFBE9Ww=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-F3CqQ3xeOkurkyc8HqO8kw-1; Thu, 30 Jun 2022 11:43:22 -0400
X-MC-Unique: F3CqQ3xeOkurkyc8HqO8kw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s1-20020a056402520100b00439658fad14so380301edd.20
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 08:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8aM4KHL+JNLyVjQkuhkhF+swAGKZ7EE8BHpxS8CwNjI=;
 b=WFMJdkKJc7eBi17cWmTSdDZIEfBtb+bqpkEBlplhLl3gaK2qV6qLBvGSdb1V7cLGrf
 zHzr2UE2dzPXanmpA8OwgHF8JptxramKRy7niFq/QqID8gHvtCq4bzUH3xB23Di5mzgL
 agvRzhLWPcSS4J4GG1/AXAYPiRQ9raNHcLBYJkge91fM+s41XWDCMI0k0egssEDxwMqS
 VP1UouGpmkZS588QaanYD1T0UMCrAQGsuAwMr3hqwOCiIicFqM+msj2vagvQ8sxk2fKJ
 QjmpL+sqTc82b17ekF73xnHnllKjb3HlblHg1G/l4D0VZRRIn/QOUpMbj0463XbhXx4U
 Sv+Q==
X-Gm-Message-State: AJIora8Hpz6hjARY0oGfLCTkurMgzGT87xOCQTzguEUSTPESnxdxL/SX
 PTDjrWTbDC8ihPct9s0+cOqOKFAJ2rDbHoIdxE7wvMt0jakWSgp2/KKMui0c5kVq9EkjCIasneb
 IyGmRFnTlXdhWXAc=
X-Received: by 2002:a17:907:2ce8:b0:72a:6315:9412 with SMTP id
 hz8-20020a1709072ce800b0072a63159412mr3586705ejc.47.1656603801684; 
 Thu, 30 Jun 2022 08:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sDsxRYTCN5VmXYN+ESChzWTnBGrrEu+664hY5bCvyqy0se3vehv4LRICoCLmL24k+cDeD+ow==
X-Received: by 2002:a17:907:2ce8:b0:72a:6315:9412 with SMTP id
 hz8-20020a1709072ce800b0072a63159412mr3586680ejc.47.1656603801430; 
 Thu, 30 Jun 2022 08:43:21 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 ch25-20020a0564021bd900b00437e027fad9sm2283258edb.48.2022.06.30.08.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 08:43:20 -0700 (PDT)
Message-ID: <70c04636-f492-0a3d-5eec-ed13b7664c7a@redhat.com>
Date: Thu, 30 Jun 2022 17:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] io_uring: fix short read slow path
Content-Language: en-US
To: Dominique Martinet <dominique.martinet@atmark-techno.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Filipe Manana <fdmanana@kernel.org>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 30.06.22 03:01, Dominique Martinet wrote:
> sqeq.off here is the offset to read within the disk image, so obviously
> not 'nread' (the amount we just read), but as the author meant to write
> its current value incremented by the amount we just read.
>
> Normally recent versions of linux will not issue short reads,
> but it can happen so we should fix this.
>
> This lead to weird image corruptions when short read happened
>
> Fixes: 6663a0a33764 ("block/io_uring: implements interfaces for io_uring")
> Link: https://lkml.kernel.org/r/YrrFGO4A1jS0GI0G@atmark-techno.com
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
> v1 -> v2: also updated total_read to use += as suggested by Kevin,
> thank you!
>
> I've tested this quickly by making short reads "recursives", e.g. added
> the following to luring_resubmit_short_read() after setting 'remaining':
>      if (remaining > 4096) remaining -= 4096;
>
> so when we ask for more we issue an extra short reads, making sure we go
> through the two short reads path.
> (Unfortunately I wasn't quite sure what to fiddle with to issue short
> reads in the first place, I tried cutting one of the iovs short in
> luring_do_submit() but I must not have been doing it properly as I ended
> up with 0 return values which are handled by filling in with 0 (reads
> after eof) and that didn't work well)
>
> Anyway, this looks OK to me now.
>
> Thanks,
> Dominique
>
>   block/io_uring.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


