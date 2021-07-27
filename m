Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457953D7B21
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:37:05 +0200 (CEST)
Received: from localhost ([::1]:34612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Q4l-0007nl-LS
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8Q3j-0005dC-Ct
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:35:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8Q3h-0003uG-UL
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 12:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627403757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iJTsDqTr1olWV4+VXKojo8RmolJ4uK6jKFDl7NP1GJc=;
 b=cgiYpD2rgnxwtdfE5p+m7dHRcOijWtn+bf8AoBHebnTA3HwNRSAhK26yCF1xxa9kxcyfuE
 CzexFws79gI7bVasj31hq/AtGdcSoovUJJTtFf6dx7YUlrL8n133HPNvrq9E1sEN7I+qlz
 Royg9FOalS0CDt6ygwJIsVh0AfGb7kE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-0rYrMj-zNYqzQU3qaPaIKA-1; Tue, 27 Jul 2021 12:35:56 -0400
X-MC-Unique: 0rYrMj-zNYqzQU3qaPaIKA-1
Received: by mail-qk1-f197.google.com with SMTP id
 t191-20020a37aac80000b02903b9402486c5so11970772qke.13
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 09:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iJTsDqTr1olWV4+VXKojo8RmolJ4uK6jKFDl7NP1GJc=;
 b=gVX/PgDz7OszTRbb7OP6RZCXD8YiKxO4pSSfJFs4vehKGm4ZCfYZAv7RwO8KzVvCvk
 0oBI0W5slMy9K+JWlfnTNNsPY3oGn45QU1wO6u4KCvRwMb8vaI9gKuNwTlLzMsjD5RMz
 bmF8ypc+f5tSUrqyjnLJONj6Ll/fUM1ULrKC02lOPWfZRmLhkJ++RKK3WsM/gsGE831d
 foLRUjJoWXjI3UE0jHiNuW62j4VS/hZ7O9z4AtWRFWDDPTdDQim0sltFEqsuYdO9bLjy
 PfmjBqxaptgrQOg+nD4t+U8njdAXlZqF1IinLUBLAHNQ5yhlHvwyJV3UPsTFYCJPiuEb
 aurA==
X-Gm-Message-State: AOAM5306PTYzoSLc83fEDxpR8PYwtAde7+t9xKQ0omk8am5xHNna68C2
 VH0P9CQrl1009wWRIehVuZ+OV1EX1zS5MYxpMzTheI6VuTg3GWPchVwbkSMlnSVh3+M8A9AwH+i
 XAEXL4SHV5VTiV/o=
X-Received: by 2002:a05:620a:204c:: with SMTP id
 d12mr22931067qka.417.1627403755722; 
 Tue, 27 Jul 2021 09:35:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM88P5IKdVp+zEDSQIKWEQ9q0COa/nnntad50H2WVvrPnYzVKedmUMjmMRJV+5oOf9fL7/Fw==
X-Received: by 2002:a05:620a:204c:: with SMTP id
 d12mr22931050qka.417.1627403755445; 
 Tue, 27 Jul 2021 09:35:55 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n14sm1657280qti.47.2021.07.27.09.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 09:35:54 -0700 (PDT)
Date: Tue, 27 Jul 2021 12:35:53 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/9] memory: Sanity checks memory transaction when
 releasing BQL
Message-ID: <YQA16WRoow9Avc6Q@t490s>
References: <20210723193444.133412-1-peterx@redhat.com>
 <7f056d75-51a1-17a8-e946-1aeccb3e1308@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7f056d75-51a1-17a8-e946-1aeccb3e1308@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 02:41:17PM +0200, David Hildenbrand wrote:
> Functions that silently drop the BQL are really nasty. I once fall into a
> similar trap calling pause_all_vcpus() from within
> memory_region_transaction_begin(), while resizing RAM blocks.

Yes, hopefull the series can help all these cases too.  Thanks for reviewing!

-- 
Peter Xu


