Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C54CF288
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:23:12 +0100 (CET)
Received: from localhost ([::1]:59362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7i2-00075h-6X
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:23:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7eG-00039y-BL
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:19:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nR7eE-00038a-S5
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646637554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejhxFPvgFrvMTLU7Wh2UhE5Zy5XKj8zjsswxXb4io1E=;
 b=SqlB6F9IT/DlSg+DGYwqgyHX7yqoyM6ZDBLANEXkl4TtSbDotPQtS5Asbqz2hS4QPwthKC
 3zZp+Y1Hrp+yPNiYhb0Fbv5hOuR/jx3R4EGx2L6Fj7+MHPDvmJSc9GATZCZhwrVI02wzXK
 00v4BTcgWv+94dPar+I2lvIguPXnR80=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-PudjRLhYOpmwz5Tj8voV9A-1; Mon, 07 Mar 2022 02:19:11 -0500
X-MC-Unique: PudjRLhYOpmwz5Tj8voV9A-1
Received: by mail-pl1-f199.google.com with SMTP id
 j1-20020a170903028100b0014b1f9e0068so7020104plr.8
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ejhxFPvgFrvMTLU7Wh2UhE5Zy5XKj8zjsswxXb4io1E=;
 b=sqfL0cyT0gGWa0WynUFCDN85U20fOjG/FGXoWp2nCyigcB01w76hJEsvAsd+zxYKEQ
 u+m1HuVubrRdDWsjmUW9H629hw/zUiNrmQl+sjMEHNTdBCq8dvrhx+6hNdLZQmMVXlyI
 qQoVg+4dAAhaO4GFOg+FgIjFYDnKHDVlCfZN2UZ4wquEqiuf4rnckb7J7SJ/XqlteaWO
 kbhBk6d43sj5tXEAr62+F93xxkeaoQYlHSn00vyKTksXFFp+JCCScUL8NLI51lAX6xys
 5uwfwDRJy8p0pzJj6Nijo1s6IOJdd+gt4A5Meby6j/QjNFt1JA9kPu2gbI11O+JbKPKD
 XQVQ==
X-Gm-Message-State: AOAM530M5EuThQQAHMYU4u03y9p9FJZq+btqYajPOp9QDpbz768qTf0U
 8ELzmj+NT547ujYlT3ChVwOlwiQH5KT+kb7jug5P7qXGH1OTn5i394A7yWUxFvceVWJKEh2CCC1
 mDsx5G9X4hCNWx+o=
X-Received: by 2002:a63:5110:0:b0:374:2312:1860 with SMTP id
 f16-20020a635110000000b0037423121860mr8852010pgb.146.1646637550174; 
 Sun, 06 Mar 2022 23:19:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwX9Ofe7dh4psNRrSQ1Y5Ub4iruLx4GzskpEHAI0LlmNDqx0s1Dp/PZWwg0/sfQuoYt2W8nPw==
X-Received: by 2002:a63:5110:0:b0:374:2312:1860 with SMTP id
 f16-20020a635110000000b0037423121860mr8851996pgb.146.1646637549934; 
 Sun, 06 Mar 2022 23:19:09 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 x7-20020a17090a1f8700b001bf1db72189sm9962355pja.23.2022.03.06.23.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 23:19:09 -0800 (PST)
Date: Mon, 7 Mar 2022 15:19:05 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 09/18] tests: introduce ability to provide hooks for
 migration precopy test
Message-ID: <YiWx6buvuMwVuunD@xz-m1.local>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-10-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220302174932.2692378-10-berrange@redhat.com>
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

On Wed, Mar 02, 2022 at 05:49:23PM +0000, Daniel P. Berrangé wrote:
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


