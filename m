Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9721E4CF370
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:18:31 +0100 (CET)
Received: from localhost ([::1]:42594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8Za-0005OI-Ny
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:18:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR8RR-00032o-C3
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:10:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR8RN-0002GA-OP
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646640600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYwz4czB7ldgGAUZR2iDOypb9Pfs9/0DjgKjwS0HHdU=;
 b=D/d5Uhb7ewjMCFDFNC2oSE+MXW7WrrcOR6n1S3OUJzhrUD/oVNOJJTt3VGZfhC5LEb+tnz
 3gj2NIEhT1hX5H9fVWbv9J82nU6rI++mbiJI2W8Y9eJzzVkrpHXRbw1P/TjG49FLEkFJzy
 XCCPr2RrmqkZdlAf+xsj4h0ygunYU0Q=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-tqya18dUM7Sxmk4KVTmTIA-1; Mon, 07 Mar 2022 03:09:59 -0500
X-MC-Unique: tqya18dUM7Sxmk4KVTmTIA-1
Received: by mail-pl1-f197.google.com with SMTP id
 d14-20020a170902654e00b001518cc774d3so7090980pln.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mYwz4czB7ldgGAUZR2iDOypb9Pfs9/0DjgKjwS0HHdU=;
 b=UCc/P+m2Oal85oYrvuO4lf9ohKqTAqGrNMSQIaN5yekxvlyboiz5Hiq6zsvZiRRVIu
 j2T4t1QPy3v9I0boZoX/uNEu2GNe6qyUmGFfuGt0O9EPjtIrLNBfw4exDVSv74+jqvjR
 /Glh66a2J5gBPaX+Pol3LTfbGxjA5lf5ofSVYfIUAsIAk63QvT/Da1bP5Z9ytj/joG3Y
 Zfe0hbgr/Upnmb3ZE+YLFTlBBn2PxIBCzFfECF3VHGkY8PPqTKPpV6e1l0Qs9c1umMUQ
 R6wMu/8KPsyh/9BKgHjduVroEC1C7iEyr8pfQLTk4bK+Vo9pPy4+Pxp/XiTQdGU6trur
 QtQA==
X-Gm-Message-State: AOAM530bi0opeCULmwFUjvQMOFVUaEHphwdKVF1xn3Z6BhGBL5WHfwkv
 z8mdyNsozxJsb+xBBB9LrDPQiztRJ9tYxHdx/Pj943XJWxTmHrSmH1YH9EFnT0msNghSCfW7Rx/
 8M75P7Btdw9CyKzA=
X-Received: by 2002:a63:1350:0:b0:378:7fb4:63eb with SMTP id
 16-20020a631350000000b003787fb463ebmr8807046pgt.457.1646640597896; 
 Mon, 07 Mar 2022 00:09:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWyfhj9T5wbqL7/od/kKX0ZyS0irWyCsCtg59giYS9eMlkxcp1wvAB+Ub+EoA/s6JuwE1krw==
X-Received: by 2002:a63:1350:0:b0:378:7fb4:63eb with SMTP id
 16-20020a631350000000b003787fb463ebmr8807028pgt.457.1646640597582; 
 Mon, 07 Mar 2022 00:09:57 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm12210525pjb.27.2022.03.07.00.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 00:09:57 -0800 (PST)
Date: Mon, 7 Mar 2022 16:09:52 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 18/18] tests: ensure migration status isn't reported as
 failed
Message-ID: <YiW90IfcEm3PMQTr@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-19-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-19-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Mar 02, 2022 at 05:49:32PM +0000, Daniel P. Berrangé wrote:
> Various methods in the migration test call 'query_migrate' to fetch the
> current status and then access a particular field. Almost all of these
> cases expect the migration to be in a non-failed state. In the case of
> 'wait_for_migration_pass' in particular, if the status is 'failed' then
> it will get into an infinite loop. By validating that the status is
> not 'failed' the test suite will assert rather than hang when getting
> into an unexpected state.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


