Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA37C4CF24D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 07:54:25 +0100 (CET)
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7GC-0003gn-UU
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 01:54:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7EN-0002KK-TG
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7EK-0007Oa-HL
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646635948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4mQ2rMxEqphQMQ2Uw22CRBGYN/1SipVPThgzv20/P4=;
 b=Dszrcr9acWLnop3hOhSKJEPddawgjcyI4m2PDuPKTKMMpumgEvyi493k3uiUK+EdR+CJlU
 4MXQcxp16WJ5OU2tiu21G+zQDyIT/72/KFcSnVuZZN3TpN32gB3gj3BxOGwJhg/U6VXbY+
 DQfmgSaBj8v+1jVIEyqgOJBfZRBMvAw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-kE9e_lBRPNCBMjA02LqJtQ-1; Mon, 07 Mar 2022 01:52:26 -0500
X-MC-Unique: kE9e_lBRPNCBMjA02LqJtQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 w68-20020a62dd47000000b004f6aa5e4824so6675552pff.4
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 22:52:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u4mQ2rMxEqphQMQ2Uw22CRBGYN/1SipVPThgzv20/P4=;
 b=56dwu2ynj0w9GRnzd1TY2LeECbQKk+0Ig8mI061/3b6JxLdaUFYDZwde5h5IYdBWsb
 EiJo2FCP4lBcVvf+uGk5AcojCXt6ZCaKxkf3JeWqheTM7iNfpEI0NzTDLoEOKi7XccsV
 bp6U6jJ42QUaS9oQCpSYK8w2yK2Gg6TVn54MmLwKdyykw5/0P2H11e7Jy/PUFCkvRlwD
 fkwvAsR/cc6hAAKTnqcgmjTGqiZmaFoaBdSiiKIFBVMKNcztcApPoGiCNk75rVdtuQOo
 2fk54i1DVGZj0LVWJabniEVgFKuWttlme9lv7zP9p8bW+mSHFppEM5n8hz5SbuhPBEk/
 sxgQ==
X-Gm-Message-State: AOAM531IMlMHxbCTvUcn3fzUl1iKa/JeiSeqGEnQX/GvkHdESifR8uAS
 FndFo5VjFxMWRFHSuIiYsBowXl7464a58XzIAYEHLUnyfk2nxMEB9LcJtR7GImUsyPRfsYXBv1/
 CZSw6eNHKfdbLYiw=
X-Received: by 2002:a17:902:ec81:b0:151:f1c5:2f9f with SMTP id
 x1-20020a170902ec8100b00151f1c52f9fmr1264212plg.123.1646635945782; 
 Sun, 06 Mar 2022 22:52:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7Mc+WrBVpTUQ3dfWto9qg0PujUVcIYiVq9OTMJAjLU+7XqEfHgzgJRqNLFSb8w7KK6F3Rfw==
X-Received: by 2002:a17:902:ec81:b0:151:f1c5:2f9f with SMTP id
 x1-20020a170902ec8100b00151f1c52f9fmr1264199plg.123.1646635945571; 
 Sun, 06 Mar 2022 22:52:25 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 l5-20020a056a0016c500b004f140564a00sm14979803pfc.203.2022.03.06.22.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 22:52:25 -0800 (PST)
Date: Mon, 7 Mar 2022 14:52:20 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 02/18] tests: improve error message when saving TLS PSK
 file fails
Message-ID: <YiWrpD7zPvV8t7yv@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-3-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-3-berrange@redhat.com>
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

On Wed, Mar 02, 2022 at 05:49:16PM +0000, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


