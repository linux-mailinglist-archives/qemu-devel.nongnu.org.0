Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A75E6BCB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:36:59 +0200 (CEST)
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obS0I-00018P-Lr
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obRsD-0001rw-Ex
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obRsA-0001AS-BX
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663874912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o7hSlWcWqOuFCDSrNay5Msjj5tXwpsHjQE7ro58YNsc=;
 b=J7oyx2QvcTdsHeiJ5CxuIMFL7MSJdQumfMst3P2aPpjU1UZcTUU0bUwkFU5N4F2tXL/+c5
 fG5LbGUW+hOsOBI0JgK9zObbWLfUEdQAcwSJ0oshBgXwEa1EKdXSvIPCqLiBM2/e9rLPOW
 1OXpep81sMBHJGEIoXMKEd2/2FCx+7A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-nYieGeUFO02ocu4PXcYCVQ-1; Thu, 22 Sep 2022 15:28:30 -0400
X-MC-Unique: nYieGeUFO02ocu4PXcYCVQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 w10-20020a05620a444a00b006ce9917ea1fso7354952qkp.16
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 12:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=o7hSlWcWqOuFCDSrNay5Msjj5tXwpsHjQE7ro58YNsc=;
 b=6/wICEoYftnq/JwofVNC8d6D0msxcV0Qj7lKFjZoe48fBSR+vbqZaPVlyS+X8gEgY8
 Kj0h9fgiae7vDbR77Nn1KGssf3+AA2TtU4rKNbO+w2QerhAxvQGgty+VhThEMqwIA82C
 bNovJRWiWlwVgUopx9DGeB6jg/FQgHx7mBhXALlpfcK+1KrVcJzz1YNdXBkXjHmG5ASQ
 uUFg1yG5qXJYFKBGthDNoRV8XIdOdJ4kxiZq+peUW6R/XelFX0U4rYG3b9Ri6XnBfRP1
 58TCnI52FCKZXTMcFVTvMEzHH6mZTmmLA9LlZaE24IJFiwxP0sXMjsWZbfRWCsyGlHIz
 t5SA==
X-Gm-Message-State: ACrzQf2F4v97srve75Xx+h76yz5NjsTd72yvwNNUDf+0dgaxflTuAQPF
 dCbB5vH4i+LF7NWeML6ygfOsat5N2/3EmsL/i13bw2yNwlcx1T2L6fqkknAdP+xu5jDW52TyrHL
 rwKJuZSQxjvKdbj0=
X-Received: by 2002:a05:620a:158d:b0:6cd:efb1:8eb6 with SMTP id
 d13-20020a05620a158d00b006cdefb18eb6mr3257764qkk.185.1663874910484; 
 Thu, 22 Sep 2022 12:28:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fJjer4kfJQ1lmHq9sDViVMqca9zqobVc0J3mN9N0mNoZ4ms1S3mr7DNU277Gsk5XbOg4VYw==
X-Received: by 2002:a05:620a:158d:b0:6cd:efb1:8eb6 with SMTP id
 d13-20020a05620a158d00b006cdefb18eb6mr3257755qkk.185.1663874910285; 
 Thu, 22 Sep 2022 12:28:30 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a37ea06000000b006cf38fd659asm4276823qkj.103.2022.09.22.12.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 12:28:29 -0700 (PDT)
Date: Thu, 22 Sep 2022 15:28:28 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 3/5] migration: Disallow xbzrle with postcopy
Message-ID: <Yyy3XN0dh/tfDWX6@xz-m1.local>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-4-peterx@redhat.com>
 <YyyFpTpuI03kdutm@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YyyFpTpuI03kdutm@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 22, 2022 at 04:56:21PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > It's not supported since the 1st day, as ram_load_postcopy does not handle
> > RAM_SAVE_FLAG_XBZRLE.  Mark it disabled explicitly.
> 
> We've already got a check in ram_save_page:
> 
>     if (rs->xbzrle_enabled && !migration_in_postcopy()) {
>         pages = save_xbzrle_page(rs, &p, current_addr, block,
>                                  offset);
> 
> so that's supposed to allow you to enable xbzrle with postcopy and take
> advantage of xbzrle during the precopy phase.

Ah!  Makes sense.  I'll drop this one.

-- 
Peter Xu


