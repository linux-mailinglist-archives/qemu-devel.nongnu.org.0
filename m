Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438A94CF24E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 07:55:10 +0100 (CET)
Received: from localhost ([::1]:36320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7Gv-0005MH-Co
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 01:55:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7FY-0003ym-5w
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:53:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7FW-0007Uw-3n
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646636017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zPTD0C2F4SfHQNl30AdKKxi/dNtZTlJJtk/vNFrseZU=;
 b=DRzoA34zIJdN2X96uzo88H6TuC/JdmbITMPeUCNWRTiMe0Q7h57oEL96Npa/wp2ZKhlTwH
 7oT+QIOaQViUd46/SephgDB6a1SP20eegQpex45CWp8a7EAYtBSg673I8+j5AB+SHHdDsO
 2paT12JONGjs82u0AoItS27J8ZstthU=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-zd1_kSGsNKSxVF42ghSA6Q-1; Mon, 07 Mar 2022 01:53:36 -0500
X-MC-Unique: zd1_kSGsNKSxVF42ghSA6Q-1
Received: by mail-pg1-f200.google.com with SMTP id
 r11-20020a63440b000000b0038068f34b0cso381310pga.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 22:53:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zPTD0C2F4SfHQNl30AdKKxi/dNtZTlJJtk/vNFrseZU=;
 b=eaJj59KMiUagh4rJQKxIaWvoUuYMe7ecagRwAcJRdTLBH7sbstH2hnJoP892pt5Nqm
 Qh8CWFuQAmBMR3jmyncsSJxcDPFaKQjtMRlBXRwNYiMzmxCDi5KLV2sGHnnete4FEGBz
 W3GPG1H8HMel6g5oSPieYDwW7ki1Pyj4cu8Hdh7oTWXZFeMPy+7gipb4RWHJDs7PkpQ/
 I25cGjXerlM/Nu/bF3wTsPgVNz5x4ymQtwrK3cbXi3coeu/3MMIY0bGHB5svqpfB/ZLj
 JPFURGPOtkmXSi7x64eXLko+99yzVcu1uF+lLfVv7JcxsowsG/JhBqiurgOpW0gT2YBx
 k9NA==
X-Gm-Message-State: AOAM5335slgZxtnO1W/F73Ch/v3chxDL6PXc5FYgEQpkDTstDCgqRW4E
 sznekS+x6eIJbCD46RiBrOyuS93bWoMxBaZ4fCt/SYWtYcyVLlyykbNxjM88YP1gcVi+qjFtbd6
 /jNfzS3u/o/9BtbQ=
X-Received: by 2002:a63:f816:0:b0:37f:f252:9f12 with SMTP id
 n22-20020a63f816000000b0037ff2529f12mr8893251pgh.318.1646636014980; 
 Sun, 06 Mar 2022 22:53:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuM0bnxTrIfsnHQovvZwyXdIc7ia7Oi/f9rgN4FUtHk/k976ZAnSWr6UMjVqTcPm1NvzA5iQ==
X-Received: by 2002:a63:f816:0:b0:37f:f252:9f12 with SMTP id
 n22-20020a63f816000000b0037ff2529f12mr8893237pgh.318.1646636014762; 
 Sun, 06 Mar 2022 22:53:34 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm10926652pgj.85.2022.03.06.22.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 22:53:34 -0800 (PST)
Date: Mon, 7 Mar 2022 14:53:29 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 03/18] tests: support QTEST_TRACE env variable
Message-ID: <YiWr6QpaVsj0hzEy@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-4-berrange@redhat.com>
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

On Wed, Mar 02, 2022 at 05:49:17PM +0000, Daniel P. Berrangé wrote:
> When debugging failing qtests it is useful to be able to turn on trace
> output to stderr. The QTEST_TRACE env variable contents get injected
> as a '-trace <str>' command line arg
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


