Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25FE4D57A7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 02:54:40 +0100 (CET)
Received: from localhost ([::1]:37364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSUUJ-000273-PK
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 20:54:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUOr-0004Ae-2k
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:49:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUOo-0003n3-Ab
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646963336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJ0zsHubsdMVGst/eEXEy72T/lOzfhzF/0nLT3JaqHA=;
 b=c0pJdZh5t4yFf4qz+cSH1/yQqXk7OWNPsnpfXQmFQ9gK0tKXLyrM100SOEqobOKnfcVTQS
 gZeqLjNBSgXSVP9tBcrGTo9Ml6XIvM8KGXqwb51jF1gScai3/xAV4fCwtQBqFOervw1f0U
 5NFphEfM7fcSOzTfP+ra53pZh3IkDsw=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-501SyDA2Pgeg0Hx3mdLBGg-1; Thu, 10 Mar 2022 20:48:53 -0500
X-MC-Unique: 501SyDA2Pgeg0Hx3mdLBGg-1
Received: by mail-pl1-f200.google.com with SMTP id
 n11-20020a170902d2cb00b0015331a5d02fso664091plc.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EJ0zsHubsdMVGst/eEXEy72T/lOzfhzF/0nLT3JaqHA=;
 b=kYEN/yELyyn+G7VOc9DyOas8Cqh711XXINWpXc6iALpiO40nNaGRqIXHP4D3apAk7T
 bK20Ga2CRX5JCZ2nnge5kgJ6+fxSOz8sOgTqlBGdaUPazVsUAFSV10m3bJeyQTMfSURL
 Ui/Iv5z03X79KVimgv7f+y5taqDczANrAPz2uxBl+9k396yFR4+zG3DmdLasUWEQJRCj
 /yE+3OiHl/XEZ5mcKfTNr+pS691gHNfbqvRC164eBuvu8jrQIZzIx8fKhbVlViqvkkwi
 8CAbygUOFJMND6sP7eKT+hb29DvxjVFbbwBq77fX/6Y/zx3ropC5N+QGsOZliju1RrCO
 F2qg==
X-Gm-Message-State: AOAM530v1SJ7dClsxFi5U7BXhWiK7v9zK37p+YSWi260NymER28CGAAc
 UwnA4oyUOaHqid+55uPLQOqNTQCVfUWrrtggYEi/j5HRARx5BitUfYFS9tndcKaDlPMtDKsXxM3
 wqsMyVqXVitWMLWo=
X-Received: by 2002:a17:903:2482:b0:150:15ed:3cd3 with SMTP id
 p2-20020a170903248200b0015015ed3cd3mr7946980plw.147.1646963331918; 
 Thu, 10 Mar 2022 17:48:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoBwjnr2YO5D/95fYthe0clAxGPAq/Sd+LS54uWwqJ9v8sBMHtSotNrHLDBE6ENzUoFKVXVw==
X-Received: by 2002:a17:903:2482:b0:150:15ed:3cd3 with SMTP id
 p2-20020a170903248200b0015015ed3cd3mr7946968plw.147.1646963331665; 
 Thu, 10 Mar 2022 17:48:51 -0800 (PST)
Received: from xz-m1.local ([191.101.132.227])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm6580128pga.34.2022.03.10.17.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:48:51 -0800 (PST)
Date: Fri, 11 Mar 2022 09:48:46 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 08/18] tests: merge code for UNIX and TCP migration
 pre-copy tests
Message-ID: <Yiqqfvb1ZPekGjtJ@xz-m1.local>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-9-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220310171821.3724080-9-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 05:18:11PM +0000, Daniel P. Berrangé wrote:
> The test cases differ only in the URI they provide to the migration
> commands, and the ability to set the dirty_ring mode. This code is
> trivially merged into a common helper.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


