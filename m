Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5A3EEBE3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 13:48:10 +0200 (CEST)
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFxZh-0001nN-5r
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 07:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mFxYb-00012A-Kk
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:47:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mFxYY-00051I-M6
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629200816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6GEQN68D+uXbzmz5OzWaRDyL0SAVb4q559jRrJitr8=;
 b=GGkztHOKJFIoDcQvnWHmLU8a2K/+2hqArXSiNVQzYvNdphLE6OcnAAKJsZtkYJyfdBxLbg
 N1/L/bQ19clZbXxtCewuNmbGMl+uqAIUY/ElaSrnj7UIGB8cewu3PuCG4EN4X/QhCcgpxp
 3MmkC35gGRFRZerlfajiZu7Y3izPS04=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-MNNCnvDrPASXiHa5ZS0uoQ-1; Tue, 17 Aug 2021 07:46:55 -0400
X-MC-Unique: MNNCnvDrPASXiHa5ZS0uoQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so6462484wri.17
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 04:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H6GEQN68D+uXbzmz5OzWaRDyL0SAVb4q559jRrJitr8=;
 b=RyWp8YXEWeQ8HO3zMu41UmI9fOophRMJ6w6RBXyxNyXo8u97d9a4jnqSnFA0S0zGTp
 XGCnRwlBsECnCkA7dDeMlTkvnmAonW+052ap9qQ0Naqig6aDRZ1yUOrdAkyM5vuUHt6Y
 Oi/aFfvwE9/Lc7v/d60i+/hFDZJj/kJWXh0VvNgRxk76wWvQIcICZIGZkNV6BZZEMQCT
 EeCEpxSxfc57+Ph/aI/xZQYaB++D+tlyK4DPGlErKDknO0ClJO7gPixciGjH/3NdaMLX
 KmhSL/F4xgluV0ZyCmy9cWXixUSLaFgc+WiJBB8zWxqrkyItUNgnSAeIWZpEWEEHjS07
 lSrw==
X-Gm-Message-State: AOAM533J0nZI7LeXuZ553fmI1cM/oSprCGCfOgoxhfFIGxJ1igRi9Y/Y
 Y2eCzzTENo9v4iB12uKmjX+9fPSUQrC8vIFzUKEM4k0aXBvQkF9d2T/AZiY5tZOm9Y87K6VX0wr
 6h39pWJ6bGX+yY9j/ewti/XGdmYUceN5dY2YVRTAQo9pOVVuficdAWuvdRc3LLJyim9I=
X-Received: by 2002:a05:6000:18c8:: with SMTP id
 w8mr3520148wrq.90.1629200814080; 
 Tue, 17 Aug 2021 04:46:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnv7hybpq1wA+RYRmkEzCKVliAlGnTXQbggYqnL5mF0VNvuywQRnwGtX0X7JSPI+3unpJZqw==
X-Received: by 2002:a05:6000:18c8:: with SMTP id
 w8mr3520124wrq.90.1629200813815; 
 Tue, 17 Aug 2021 04:46:53 -0700 (PDT)
Received: from [10.43.2.192] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s13sm1875191wmc.47.2021.08.17.04.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 04:46:53 -0700 (PDT)
Subject: Re: [PATCH 2/2] monitor: Report EBADFD if fdset contains invalid FD
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <cover.1629190206.git.mprivozn@redhat.com>
 <c0fa7920817020ae2744313ab631e7d76f4c1898.1629190206.git.mprivozn@redhat.com>
 <CAMxuvaxeHOrexy6sTBU=1PBBUThi60A2aJ7CWvE+DytR9q_Cuw@mail.gmail.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <3ed4b931-d8f7-50b4-a2db-2667d58cace3@redhat.com>
Date: Tue, 17 Aug 2021 13:46:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvaxeHOrexy6sTBU=1PBBUThi60A2aJ7CWvE+DytR9q_Cuw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 11:59 AM, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Aug 17, 2021 at 12:56 PM Michal Privoznik <mprivozn@redhat.com>
> wrote:
> 
>> When opening a path that starts with "/dev/fdset/" the control
>> jumps into qemu_parse_fdset() and then into
>> monitor_fdset_dup_fd_add(). In here, corresponding fdset is found
>> and then all FDs from the set are iterated over trying to find an
>> FD that matches expected access mode. For instance, if caller
>> wants O_WRONLY then the FD set has to contain an O_WRONLY FD.
>>
>> If no such FD is found then errno is set to EACCES which results
>> in very misleading error messages, for instance:
>>
>>   Could not dup FD for /dev/fdset/3 flags 441: Permission denied
>>
>> There is no permission issue, the problem is that there was no FD
>> within given fdset that was in expected access mode. Therefore,
>> let's set errno to EBADFD, which gives us somewhat better
>> error messages:
>>
>>   Could not dup FD for /dev/fdset/3 flags 441: File descriptor in bad state
>>
>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>>
> 
> I am not sure this is any better. If you try to open a read-only file, the
> system also reports EACCES (Permission denied). This is what the current
> code models, I believe.

Fair enough. Another idea I had was that if an FD that's O_RDWR was
passed but only read or only write access was requested then such FD
could be accepted because it is capable of reading/writing.

But since patch 1/2 was accepted then I guess 2/2 is not that much needed.

Michal


