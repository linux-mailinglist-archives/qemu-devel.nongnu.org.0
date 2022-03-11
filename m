Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91C4D57A2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 02:52:28 +0100 (CET)
Received: from localhost ([::1]:59998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSUSC-0006pR-02
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 20:52:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUPS-0004Z4-Q2
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:49:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUPP-0003tV-GW
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646963373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2w/x+ZyNQwVvFL1onqKK6a6KwPrZ57Urep3UMbxubY=;
 b=XiYzdcxNZBKTHJyoJs6Pv3DAimPV5jt19LhwKuiDABY+qZH7jDM3ipPb917jAqnqAKBzpu
 iCl6hShjgMSXDbavMLtjgpGmNTOMwiGRQCh2+0y99CQ61hfG0iR+XUJi/neFHYAOylwvXd
 tWZ/WEzYClIPhPlx6Asy5Oqg78vSBSU=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-oLIkWFR9PSW5lF7b-wKJsQ-1; Thu, 10 Mar 2022 20:49:30 -0500
X-MC-Unique: oLIkWFR9PSW5lF7b-wKJsQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 y7-20020a626407000000b004f6d39f1b0fso4305669pfb.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=j2w/x+ZyNQwVvFL1onqKK6a6KwPrZ57Urep3UMbxubY=;
 b=mkLG+NSiTXOuOelc1VpoqVrqrY+7363aQRPXygtxgzQIeBT7ll+UL2ODM8dyrYnhcA
 LTMRqebAPAJ8Lgc0Qsz7cfi1PmGjBH/mDwMHrb6EKOSzyHGEXbV/r9/G3lYnU88P8SBK
 gDxhqfeJnHpUZsa+85y5fYOch3oynXjl6+pWlDFE85hGT37c5z+EQzcQk8w7CKwdlrne
 +eKKdlOaA9WCx9VTZ9A0iG6o27pZiVtOZF6ddz7dDaDyvkWDSFDKkQy3PuUBitk7pCpf
 ZAxcFUkGVFpomOr9vEMIysVD1+iQA/5FX8HSTMCJS5h5IrzWUi/BccWUdagbCppkvolZ
 /m6g==
X-Gm-Message-State: AOAM532n+TFoIjez/vV6tDYBXJJMpJ7UPtdGWVp8QSWtjRXWLStPBe9q
 Iincg1iiKF/4qg2WtuRi1bCN9JcTY/19Ww8poJh5H0/o+mCZd0rODelWUb4CXlGaXeoJBIxlGdq
 zvFi0B4tKc+67gu8=
X-Received: by 2002:a17:90a:578f:b0:1b9:b03f:c33c with SMTP id
 g15-20020a17090a578f00b001b9b03fc33cmr8163616pji.114.1646963369456; 
 Thu, 10 Mar 2022 17:49:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9KYRqFVTkYK4zx+pF6TcTb7BrWjGkUtR0FHejaROByl1nF3eUezB8gZ+58j+pCwy+Bo3ESA==
X-Received: by 2002:a17:90a:578f:b0:1b9:b03f:c33c with SMTP id
 g15-20020a17090a578f00b001b9b03fc33cmr8163596pji.114.1646963369236; 
 Thu, 10 Mar 2022 17:49:29 -0800 (PST)
Received: from xz-m1.local ([191.101.132.227])
 by smtp.gmail.com with ESMTPSA id
 x33-20020a056a0018a100b004f71b6a8698sm8373033pfh.169.2022.03.10.17.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:49:28 -0800 (PST)
Date: Fri, 11 Mar 2022 09:49:23 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 09/18] tests: introduce ability to provide hooks for
 migration precopy test
Message-ID: <Yiqqo6PYLEqFE25y@xz-m1.local>
References: <20220310171821.3724080-1-berrange@redhat.com>
 <20220310171821.3724080-10-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220310171821.3724080-10-berrange@redhat.com>
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

On Thu, Mar 10, 2022 at 05:18:12PM +0000, Daniel P. Berrangé wrote:
> There are alot of different scenarios to test with migration due to the
> wide number of parameters and capabilities available. To enable sharing
> of the basic precopy test scenario, we need to be able to set arbitrary
> parameters and capabilities before the migration is initiated, but don't
> want to have all this logic in the common helper function. Solve this
> by defining two hooks that can be provided by the test case, one before
> migration starts and one after migration finishes.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


