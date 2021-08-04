Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA943E052C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 18:03:32 +0200 (CEST)
Received: from localhost ([::1]:37640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBJMc-0006pL-Vh
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 12:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mBIET-0000vN-OV
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mBIEQ-0002D2-5J
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628088653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yuDZrQJMOKE9pfxIlRrMCYHwPCIvI7DV6jHUVi9+HcU=;
 b=a6uQtDIZ4c72iFQgQl0m+i78KKdYmGiYkiAcNsTvd8TnR7sYGmpR/AZgddCAyOTyn3RYDc
 LF59EDj/cAraBRhjg8X7Xjbd9QaI5a6gcBhLCnoxfvU0Ov1JKqQ0A6hWlTZaNe6BU8VjhO
 FFyu9tTylwQ5QCqfvosCWX1m/vdM88I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-TApHjE5HNYG0WQDsXKq-Fg-1; Wed, 04 Aug 2021 10:50:52 -0400
X-MC-Unique: TApHjE5HNYG0WQDsXKq-Fg-1
Received: by mail-ej1-f72.google.com with SMTP id
 k22-20020a1709061596b02905a370b2f477so905345ejd.17
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 07:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yuDZrQJMOKE9pfxIlRrMCYHwPCIvI7DV6jHUVi9+HcU=;
 b=B/2er0MUxQiKH+PxfCNWBhzGCe2NdbyRpFWP1ZH+7tniMF17GCbENG8YLTn9A955R9
 gf2ie8jM5Iqu4FRU6AOtAkFpvy7EILt330jBDcGdCQGoKRzhVCZ75vDvJQJUhyROa+iY
 ZgjviMQuLWX9sHSsauScvRLN46El2RCxGGNESiUg4a3dNpcSeErmi36twYz0kdEcA6UB
 B/HN17cUqG+DdD/0/k7qRwXx0JIrCE12FgCDZ/fBFVsIDCbrFLgvsqLKjHVKqWne6rHT
 wAkq7KTE+v+RolBLVayrOYCFj5JDALlPBEd9rSb/46JCNxWMOw2A099ZLjVKU9BrVwqz
 NCjg==
X-Gm-Message-State: AOAM533vqf303cGzNboGUFT3f3Zn/hIScWcNavIh+izpm2AU+xhM9IxT
 e/6LSqKkCMSmYY2n4OlxVKE2P0zHeIzng0VkSPeZQxEUVArK8h5C57swNpy42oBZVNM3wkrGUCW
 1SjhZ76ZNBrGqhTY=
X-Received: by 2002:a05:6402:22b0:: with SMTP id
 cx16mr83094edb.185.1628088650808; 
 Wed, 04 Aug 2021 07:50:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9m7llB1Q862hviSiTyXLSbue/gqUr8sSTngVI6vBBmQBNcnNU2f5CwUmXVykvdxriT4pFsQ==
X-Received: by 2002:a05:6402:22b0:: with SMTP id
 cx16mr83075edb.185.1628088650657; 
 Wed, 04 Aug 2021 07:50:50 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id nb39sm718945ejc.95.2021.08.04.07.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:50:50 -0700 (PDT)
Date: Wed, 4 Aug 2021 16:50:48 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] block/io_uring: resubmit when result is -EAGAIN
Message-ID: <20210804145048.awmlthlwlv3vcohu@steredhat>
References: <20210729091029.65369-1-f.ebner@proxmox.com>
 <YQfnxLROKL/JUKyF@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YQfnxLROKL/JUKyF@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "open list:Linux io_uring" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fabian Ebner <f.ebner@proxmox.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 02, 2021 at 02:40:36PM +0200, Kevin Wolf wrote:
>Am 29.07.2021 um 11:10 hat Fabian Ebner geschrieben:
>> Linux SCSI can throw spurious -EAGAIN in some corner cases in its
>> completion path, which will end up being the result in the completed
>> io_uring request.
>>
>> Resubmitting such requests should allow block jobs to complete, even
>> if such spurious errors are encountered.
>>
>> Co-authored-by: Stefan Hajnoczi <stefanha@gmail.com>
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>> ---
>>
>> Changes from v1:
>>     * Focus on what's relevant for the patch itself in the commit
>>       message.
>>     * Add Stefan's comment.
>>     * Add Stefano's R-b tag (I hope that's fine, since there was no
>>       change code-wise).
>>
>>  block/io_uring.c | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/io_uring.c b/block/io_uring.c
>> index 00a3ee9fb8..dfa475cc87 100644
>> --- a/block/io_uring.c
>> +++ b/block/io_uring.c
>> @@ -165,7 +165,21 @@ static void luring_process_completions(LuringState *s)
>>          total_bytes = ret + luringcb->total_read;
>>
>>          if (ret < 0) {
>> -            if (ret == -EINTR) {
>> +            /*
>> +             * Only writev/readv/fsync requests on regular files or host block
>> +             * devices are submitted. Therefore -EAGAIN is not expected but it's
>> +             * known to happen sometimes with Linux SCSI. Submit again and hope
>> +             * the request completes successfully.
>> +             *
>> +             * For more information, see:
>> +             * https://lore.kernel.org/io-uring/20210727165811.284510-3-axboe@kernel.dk/T/#u
>> +             *
>> +             * If the code is changed to submit other types of requests in the
>> +             * future, then this workaround may need to be extended to deal with
>> +             * genuine -EAGAIN results that should not be resubmitted
>> +             * immediately.
>> +             */
>> +            if (ret == -EINTR || ret == -EAGAIN) {
>>                  luring_resubmit(s, luringcb);
>>                  continue;
>>              }
>
>Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>
>Question about the preexisting code, though: luring_resubmit() requires
>that the caller calls ioq_submit() later so that the request doesn't
>just sit in a queue without getting any attention, but actually gets
>submitted to the kernel.
>
>In the call chain ioq_submit() -> luring_process_completions() ->
>luring_resubmit(), who takes care of that?

Mmm, good point.
There should be the same problem with ioq_submit() -> 
luring_process_completions() -> luring_resubmit_short_read() -> 
luring_resubmit().

Should we schedule a BH for example in luring_resubmit() to make sure 
that ioq_submit() is invoked after a resubmission?

Thanks,
Stefano


