Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15C234243F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 19:15:39 +0100 (CET)
Received: from localhost ([::1]:47692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNJes-0006gZ-FV
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 14:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lNJbt-0005yS-8K
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 14:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lNJbn-0002Kt-I5
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 14:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616177545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4CZ7ifFExekXYLnbLaF2GdPBY2jjEHrVTesqIkERlec=;
 b=jI/09QsjrePTuwxBvxyQeiEyZJdmIxQb/3EKBURfplb88rOus3rIFprupGYt/CbjeeU8lz
 z67RSe5S0gPA1Z5u3jr2x8EWzuWuGDg8cTWyGavhg1GHMpKsl2a9VnTauqVjOyOZ6nLZAo
 +p55zrFdvjYnjv7TCXsAT8gnc/B+Zio=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-tzY-8yeCMieoOLtSvIX4pA-1; Fri, 19 Mar 2021 14:12:23 -0400
X-MC-Unique: tzY-8yeCMieoOLtSvIX4pA-1
Received: by mail-qv1-f69.google.com with SMTP id bt20so23652095qvb.0
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 11:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4CZ7ifFExekXYLnbLaF2GdPBY2jjEHrVTesqIkERlec=;
 b=q7fQ10qlAEma+WHNmVyIHAFxIJmW6JFPin3LQOsTXvSqg6zixh85OZdBjXNXbiPIt1
 FGehbMHjjnQiH/Zpkhlw6xf8LP0qdkZUcwcnZsxHY8uuUaXxPpRsGDiRenI43BrDbnd+
 XiHdvSVNITZN18X2ijJ9UntHwZPmwjiRWbmOmFQXrZo8lVtFz0JYZKmcYu/c63isA6gU
 iD+TZg7HsJhuoLDry1clgsvKLfFFdclWRXzSVdkle58GCRWdenYKby0rz7Pl5EL33BRQ
 0NwCf1cZ3ev00dt/SuZ8XUX8M0RAhpTuKyUm/ckrQnkhMYFvxSYbBl5BcS1qTFYoY+hW
 GAcw==
X-Gm-Message-State: AOAM533ejR2RbP9iNYdoaBXbQCmMVjIahjY29K8FohBFE4FlR6jCSL51
 hVqqZzq76sDYfC3cy0P5rMo/kG9JCpYth+/JMGmEIjmpqNjy8hFRs1ClG5boGYm929kzixv1CqM
 CLCKuyVMfyfzK2nhu9Z1Vqgxxm8toetbTwghwLuQ3djELazX57tHjgviwf5QPRMjN
X-Received: by 2002:ac8:7b8d:: with SMTP id p13mr9483756qtu.94.1616177542557; 
 Fri, 19 Mar 2021 11:12:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuBzDeu9ZMRV43oRC/hwHbeTmO8tGOKLlivlMmk1r3JFc1+BhOAXJtumFzgEFCIHKR0hY/Jg==
X-Received: by 2002:ac8:7b8d:: with SMTP id p13mr9483730qtu.94.1616177542243; 
 Fri, 19 Mar 2021 11:12:22 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id i25sm4990260qka.38.2021.03.19.11.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 11:12:21 -0700 (PDT)
Date: Fri, 19 Mar 2021 14:12:20 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 00/10] KVM: Dirty ring support (QEMU part)
Message-ID: <20210319181220.GB97510@xz-x1>
References: <20210310203301.194842-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310203301.194842-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 03:32:51PM -0500, Peter Xu wrote:
> This is v5 of the qemu dirty ring interface support.
> 
> v5:
> - rebase
> - dropped patch "update-linux-headers: Include const.h" after rebase
> - dropped patch "KVM: Fixup kvm_log_clear_one_slot() ioctl return check" since
>   similar patch got merged recently (38e0b7904eca7cd32f8953c3)

Ping - I think it missed 6.0 soft freeze, so it's a ping about review comments,
then hopefully it can catch the train for 6.1, still?  Thanks,

-- 
Peter Xu


