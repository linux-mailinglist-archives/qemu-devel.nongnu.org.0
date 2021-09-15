Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A34540C793
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:37:22 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQW2L-0000Tv-LK
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQW0k-0007QO-Ap
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:35:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQW0f-0005Bf-Us
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631716535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OpmHPPq8ZWtb/tHVGmtJ3J1C0x8UWnJsdrKArgaFgnM=;
 b=GOpsT4+sq15Ue78p3XZW5prW6hhcIfLrturv2jWdgd+bM4joREI5Y+lbA76Z3/D2JsQ2O/
 AD5RdNV251jZGblXhm/7OZm9g5n9JExAzxyznd7FEu6nkJwyzpZs6WxjKc1LpaqQA3a2U6
 rpb/ZQPDMsdIxTFbm3gNL3bBsGTyipI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-ZQdzkB2bPAiMBiGzy2Xg-Q-1; Wed, 15 Sep 2021 10:35:35 -0400
X-MC-Unique: ZQdzkB2bPAiMBiGzy2Xg-Q-1
Received: by mail-pl1-f200.google.com with SMTP id
 e2-20020a17090301c200b0013b8b16c22cso947220plh.5
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 07:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OpmHPPq8ZWtb/tHVGmtJ3J1C0x8UWnJsdrKArgaFgnM=;
 b=6wDCQlCRHBocCrF3J9+SCXB3lfOplUUKUgJI1BUKcDZFwPzQgmsMLp6D5HrYz3KUzZ
 lx8epqoA9HV/VLSYy4nrDdK8WC2J9AdIZIwFnN0cs9Q6IWOPfu0A5mxmfsad4MFnYsNL
 PL/F0B5BuEDdy3BKVX6iA93abo4hKA4TiTv0Zy/sSdYy3a+wjZbfpJkx+3SO2nlRTfpw
 KbWoe+EeSmBYIQPOMrvrv51C+ucb6N0AOlJpJ91w12obgANELc9qhQOIj8mLIzFbG9vE
 3hUhbAuapPThS641m2G/3pC2m0fgrRXb9l7ykL5ZUjBhySihP85nW2FK8p8ZC3zG+A19
 xKwA==
X-Gm-Message-State: AOAM530HDWHgMK5fiwZfaKGLfznsH+dEs/51L+tBDmAVR1p4drd2YYAH
 74RJqYQEg89Q4vqJmurxefXJBHmINI8DBZ9tiSIEDc3gCBfCn0p1lkIoaol05U51PCQHX47yTGp
 eitAcun8iVVxWL2sIKXhBk40Bw6PetQY=
X-Received: by 2002:a63:9d4c:: with SMTP id i73mr104040pgd.216.1631716533624; 
 Wed, 15 Sep 2021 07:35:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJSmP+TaWeXV5IHWaR23j42u6Ba3FdNYMUoX8MDGF1nc7j3KUGSEFmDwnGAgpRjR/TY3Q8yHTXUIc0edTaZF8=
X-Received: by 2002:a63:9d4c:: with SMTP id i73mr104016pgd.216.1631716533349; 
 Wed, 15 Sep 2021 07:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210915125452.1704899-1-berrange@redhat.com>
 <20210915125452.1704899-3-berrange@redhat.com>
In-Reply-To: <20210915125452.1704899-3-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 15 Sep 2021 11:35:06 -0300
Message-ID: <CAKJDGDaa4xx1HQCObs4rNTV569Koyc71TvfbHCRu_ddQVEDh=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] gitlab: fix passing of TEST_TARGETS env to cirrus
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 9:55 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> A typo meant the substitution would not work, and the placeholder in the
> target file didn't even exist.
>
> The result was that tests were never run on the FreeBSD and macOS jobs,
> only a basic build.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/cirrus.yml       | 2 +-
>  .gitlab-ci.d/cirrus/build.yml | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


