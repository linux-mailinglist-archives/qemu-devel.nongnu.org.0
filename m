Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BBF3D3C38
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 17:11:55 +0200 (CEST)
Received: from localhost ([::1]:57996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6wqA-0006gE-4k
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 11:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6woF-0005Gu-PR
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6woB-0007FI-93
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627052988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkXXwFH2FUkaGexZmbZ+UYqm5KyldCYM3AIaJsfo0fk=;
 b=JH98RHfawNj0DEmLdyTVNR/yHoCJIUdVzzuq8Ce56iGpuqnlwbhikfS87WIf4qB3YRSXHG
 +3kpdaFQWd3VhKIRhZr9mVa4GT9M9/ojUcOY5tOcdXXXEiISZfAI9aB7JCWR8jlD2XeNl8
 1WBYXdaYRBXZRNuX8b/0+scBHkMBEK4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-ris4WkCmOWOF1RWKG-Hm3g-1; Fri, 23 Jul 2021 11:09:47 -0400
X-MC-Unique: ris4WkCmOWOF1RWKG-Hm3g-1
Received: by mail-qk1-f197.google.com with SMTP id
 h5-20020a05620a0525b02903b861bec838so1387157qkh.7
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 08:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IkXXwFH2FUkaGexZmbZ+UYqm5KyldCYM3AIaJsfo0fk=;
 b=p9We0/YdOzanbKwff10MW7wKW1gPCCe2Zc9xjqKaFJZ1cUtUti5pqx7w9oMM7uvhoq
 CwLdHm6nMWBc81Zc29bMbobuq+RcHOEJ4OjNfLOoD5/JK626SEGK2Tmk5hKvpFCf/h93
 vkCIemJnbrwZHyMhiKycUmMxB6XcM7yATNwpaaZNwG5LcURfq1++tBg6HlP9Gfx1fun/
 US0kCJb8Wojez3hCo79vMQLfytrcxUSFJFTpyK8s1fCn1AZMTEYoMBYYESrpNCEORrRu
 8fxoihkTUcFst5hP9nhpnfuiZ2r70nKzC1m61edg+d2ojerH3yjZ8LuDLAF/0/+p9PJP
 RQkg==
X-Gm-Message-State: AOAM532WMtCqecY6m2jQMAhThOxDdcX8Yx7vPqRUboqbbLzLKStDCO1i
 CPMvQWIkGWRvQmPG46LWphaOpeIk+JLp+GSeEGoZOvonYe5Zv0bZv7qKOvJMSbY6jyO0vzwK1Pv
 qxX7ZofpGuWxSUfk=
X-Received: by 2002:a37:44cb:: with SMTP id r194mr5106625qka.436.1627052987382; 
 Fri, 23 Jul 2021 08:09:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpv1vrERlczCXUSj/K6WZeHGJAnHQ+1JI9Hmnf7yPRpDZNauA/zXCMEtNZiYgAvZb/93N2ew==
X-Received: by 2002:a37:44cb:: with SMTP id r194mr5106607qka.436.1627052987179; 
 Fri, 23 Jul 2021 08:09:47 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o63sm1672313qkf.4.2021.07.23.08.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 08:09:46 -0700 (PDT)
Date: Fri, 23 Jul 2021 11:09:45 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 3/5] softmmu/memory_mapping: never merge ranges
 accross memory regions
Message-ID: <YPrbuQzy6KCOpYlN@t490s>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-4-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720130304.26323-4-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 03:03:02PM +0200, David Hildenbrand wrote:
> Let's make sure to not merge when different memory regions are involved.
> Unlikely, but theoretically possible.
> 
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


