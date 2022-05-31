Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203C3538D04
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:39:24 +0200 (CEST)
Received: from localhost ([::1]:39426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvxPP-0007oW-8M
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvxMn-0006Yl-O1
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvxMk-0008LK-V4
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653986194;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OJosmadwaZrcCAyKiBccF3XJ30hJPvrl748luVxs2H0=;
 b=OSaRKbflmRkAL/XCTT5iQPjUVg7F0H9p5mZtZWUfS3TBFMF9QbTNg7bTNd3RexuQd08s61
 AXwpnkPloaaunM7I2ULEUSxfZCqWMqCeNE4AGwHGRJ6nxg/RxTQhEtHqo+lcFebphCnJ2l
 CZiGOw7B+BTZ9849fg1LVALxfiJ6rm0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-1Y42aO7bPbOadI7YiXmWXQ-1; Tue, 31 May 2022 04:36:30 -0400
X-MC-Unique: 1Y42aO7bPbOadI7YiXmWXQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 z5-20020a5d4d05000000b0020e6457f2b4so1882813wrt.1
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 01:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=OJosmadwaZrcCAyKiBccF3XJ30hJPvrl748luVxs2H0=;
 b=5x6Xo81LAfvJSQDHMrFK35ZTDysB2QG3BLy2tZlZq8lKHAq9GhoPSe3oV5EgQlYZWt
 oZp6soBZwiP+Wwa9giLTI2qnU+or50iWkI24ZHADUQK4twdQnfkt2/KbWGgWKEyb4oHZ
 S1QQLazcCu/pmFtSl/kbbwRJXbrJVwSGKhojVwpzEaZIvuspu/BOlbsaap5aVooHKCDZ
 aUXA29ZFwYjFC1V3c86Nrz8sEP82QGY/DIXCh/4lWGUE9RqhRMfNpCwrP10mlWGMcjbd
 RtJfuQh6OciTQEnFe5nbP612Pzq6y7w2qoE45iPpTKimgn5c+QdLxlATo17BTT6+30ml
 MPNg==
X-Gm-Message-State: AOAM532sbkzTxVkPXd9cCQfm/xPEFo/XtG7L5vmJfqRHjPqpJTK6g4EK
 TC3evfZHnHhUxzE/4ah0VzCqCLh7rIF/z7W6YwLHsb5BEURAKxoN6rFi82tYRNnssOejjtfBJXv
 odISIFLmxjYfdJmE=
X-Received: by 2002:a05:600c:42c1:b0:397:4154:ec9b with SMTP id
 j1-20020a05600c42c100b003974154ec9bmr22445524wme.18.1653986189475; 
 Tue, 31 May 2022 01:36:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTsytkhZMytk+HH7vMuQ5rFSiX1wuM3O43Ah29Gk7Z56c9c1wx/DhipdMIGetj7FutBKbz6g==
X-Received: by 2002:a05:600c:42c1:b0:397:4154:ec9b with SMTP id
 j1-20020a05600c42c100b003974154ec9bmr22445508wme.18.1653986189254; 
 Tue, 31 May 2022 01:36:29 -0700 (PDT)
Received: from localhost (static-88-175-6-89.ipcom.comunitel.net.
 [89.6.175.88]) by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5847000000b002101ed6e70fsm10236900wrf.37.2022.05.31.01.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 01:36:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>
Cc: qemu-devel@nongnu.org
Subject: Re: KVM call for 2022-05-31
In-Reply-To: <87v8toxuel.fsf@secure.mitica> (Juan Quintela's message of "Sun, 
 29 May 2022 16:53:06 +0200")
References: <87v8toxuel.fsf@secure.mitica>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 31 May 2022 10:36:28 +0200
Message-ID: <87czfup08j.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> wrote:
> Hi

Hi

As there are no topics on the agenda, call  gets cancelled.

Happy hacking, Juan.

> Please, send any topic that you are interested in covering.
>
> At the end of Monday I will send an email with the agenda or the
> cancellation of the call, so hurry up.
>
> After discussions on the QEMU Summit, we are going to have always open a
> KVM call where you can add topics.
>
>  Call details:
>
> By popular demand, a google calendar public entry with it
>
>   https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ
>
> (Let me know if you have any problems with the calendar entry.  I just
> gave up about getting right at the same time CEST, CET, EDT and DST).
>
> If you need phone number details,  contact me privately
>
> Thanks, Juan.


