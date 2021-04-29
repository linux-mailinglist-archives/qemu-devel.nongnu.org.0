Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D93036EB39
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:17:28 +0200 (CEST)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc6Xn-00033v-D7
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc6UZ-00024t-Eo
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc6UX-0003zS-RE
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619702045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YNDady5+JJ7NjQfJHFsCxgGF67pbM8RxFRhCvS8bGZ4=;
 b=OtIpU6xYhdrkqxG4zpKekBZefIreIhsIlWZz/wX/W6an3ndrsmvJfRRoavxOWUVjCGQomy
 qtGKc5McXJkFnOZShRhaGVWEy731kymbq+dFPUVUCMoUKrnor0/LYXY6DMKNw62WW06Ind
 2lcKYrHkZr7ScIZYScB2JXGN0ZoycWE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-2N2A34jxN6C6NrTXURjS3w-1; Thu, 29 Apr 2021 09:14:03 -0400
X-MC-Unique: 2N2A34jxN6C6NrTXURjS3w-1
Received: by mail-wr1-f70.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso1807847wre.8
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 06:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YNDady5+JJ7NjQfJHFsCxgGF67pbM8RxFRhCvS8bGZ4=;
 b=tXkP36bxWGtj4660u8VwbCZjbe0NFq4IAZpJXFv2PW7YSaq5ZSKLnbCwNv04a2oz+K
 gGLkeaidn3YTIt4bCKpSC9Iw3q4XUfn4g5Z6VtzfpcXR9hou/4VZZT8AsSrQqP2RWw68
 Nb3O3GdaY5fGmGbmM109nic1mysly7aFEyoLwbRM7wvvCIgvpVAAByB7Rm6odkpoGDay
 TpNi99/XDwL7DQhpKl6obFtBV8dWSAnFlzw4mootSzdS0BauaXNt+fMLHylFmEybmY6W
 3j5lRz/43aA+DYcQBpcSlFKgFZSzBEO+gS5hGJWcav8UdQY4Eh+djJjp+N2aK1iqTcZe
 1Fag==
X-Gm-Message-State: AOAM530eXiYt7CUC8TpahWEh5gNNMvVArx2V/kriA9lKze2z7oYuL/H9
 YUEl0u3yg7agNISiRhIhhXSWfFzO4HJTBygd6NB/uJLj5Hqdt8w+XmQM3bYI8GFI1wx15zetZd5
 7IvG/JlD0xfpfntI=
X-Received: by 2002:adf:f190:: with SMTP id h16mr29294883wro.393.1619702041911; 
 Thu, 29 Apr 2021 06:14:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1MExN3KVuUhtUgWImKz77t75UyYwDhPUjrJApTUptIX3AZsoxK2xwfeiIPQfP789NnUL3xQ==
X-Received: by 2002:adf:f190:: with SMTP id h16mr29294854wro.393.1619702041708; 
 Thu, 29 Apr 2021 06:14:01 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id o17sm1174972wrs.48.2021.04.29.06.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 06:14:01 -0700 (PDT)
Subject: Re: [PATCH v5 01/10] util: vfio-helpers: Factor out and fix
 processing of existing ram blocks
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210429112708.12291-1-david@redhat.com>
 <20210429112708.12291-2-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d129c7d0-a095-c42a-7959-6731271abe2d@redhat.com>
Date: Thu, 29 Apr 2021 15:13:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429112708.12291-2-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 1:26 PM, David Hildenbrand wrote:
> Factor it out into common code when a new notifier is registered, just
> as done with the memory region notifier. This keeps logic about how to
> process existing ram blocks at a central place.
> 
> Just like when adding a new ram block, we have to register the max_length.
> Ram blocks are only "fake resized". All memory (max_length) is mapped.
> 
> Print the warning from inside qemu_vfio_ram_block_added().
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/core/numa.c            | 14 ++++++++++++++
>  include/exec/cpu-common.h |  1 +
>  softmmu/physmem.c         |  5 +++++
>  util/vfio-helpers.c       | 29 ++++++++---------------------
>  4 files changed, 28 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


