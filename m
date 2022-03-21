Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB854E2DB3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:17:53 +0100 (CET)
Received: from localhost ([::1]:33010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKjA-0001ZL-5i
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:17:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWKfu-0007JK-L1
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:14:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWKfr-0008BM-2j
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647879265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Zra4UF5/pWpvYIf86S93YgOWIDcXEFMhQWUMgavmCo=;
 b=KNycv0JtWZ6f639mUEAixED7aRFVClPybxPRjubZA7UlPKRLYb6+TtCvNgBkusgOr4C4qJ
 gKLeUhjMZlxoCEz/QXaFir201Bjbk/T/kw+TmWjK0S88AjBwLQZA+A4ffVWWp7AfUx8Axi
 Lc6VqB8Gtmo/1QKM5rSehu9CFeKJpjA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-tx0Ej7QEOaeYp5AeO89TaQ-1; Mon, 21 Mar 2022 12:14:22 -0400
X-MC-Unique: tx0Ej7QEOaeYp5AeO89TaQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 ga31-20020a1709070c1f00b006cec400422fso7285571ejc.22
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Zra4UF5/pWpvYIf86S93YgOWIDcXEFMhQWUMgavmCo=;
 b=jlPQp8/7pR8I6Rn1FXAcDwXwMVBAC3liItstvfYIGqYfazAOXiApxElg/Zm7VsO2a6
 CH33unqTt3g2bZIeMkFpx/IzpTTT2hgmsW5MHWnk37YiRhsGFBn2Dxn23PuOpx9taam+
 2WLFZReJk2f4e8JJn+oLVUw/W4eP51o8ii2ipamsCh4np6+B8sV/iztSyUR4tLquryFh
 b7RsGaBP8Hik2SExRKHjWLjM4Cm9rdUbU98YVG7Gn/aFX0y3zfuV+QLYWcEVcqwpEQ5J
 uXx61eE5fN/pZ47kB21Vx9sYazziN2hbFSmwUZ4NeF7FKtNixqO61yPs3E8bmFllRCKq
 9FqA==
X-Gm-Message-State: AOAM530/5rbyKud/VtIEqRSDdg3dA9OOWOuS59voNn+4FS6fyp15xbJm
 xAT7e2bjqDCDiNgM3zMSCv2c6FlBELf7c12UGnPJafXmy8tRvoDZIw185fEchY16VML/j2QnWRc
 7wj0tLNsSaC2XCaE=
X-Received: by 2002:a17:907:7b92:b0:6db:71f1:fc20 with SMTP id
 ne18-20020a1709077b9200b006db71f1fc20mr20652172ejc.343.1647879261066; 
 Mon, 21 Mar 2022 09:14:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywW7g3wSDdhmorPA8CVrOYh+EDZxGe3UlGmOHmY0h+WuRNFnJWW4mcZPYzLaft3MpPJ3IQGg==
X-Received: by 2002:a17:907:7b92:b0:6db:71f1:fc20 with SMTP id
 ne18-20020a1709077b9200b006db71f1fc20mr20652154ejc.343.1647879260831; 
 Mon, 21 Mar 2022 09:14:20 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a170906608e00b006d1455acc62sm7171171ejj.74.2022.03.21.09.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 09:14:20 -0700 (PDT)
Message-ID: <f71c35ff-1db2-7491-c9fe-a0dd3ab1cbee@redhat.com>
Date: Mon, 21 Mar 2022 17:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/4] Improve integration of iotests in the meson test
 harness
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220223093840.2515281-1-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220223093840.2515281-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.02.22 10:38, Thomas Huth wrote:
> Though "make check-block" is currently already run via the meson test
> runner, it still looks like an oddball in the output of "make check". It
> would be nicer if the iotests would show up like the other tests suites.
>
> My original plan was to add each iotests individually from meson.build,
> but I did not get that done reliably yet [*], so here's now a cut-down
> version to improve the situation at least a little bit: The first three
> patches are preparation for the clean-up (long-term goal is to get rid
> of check-block.sh, though we're not quite there yet), and the final
> patch adds the iotests not as separate test target in the meson test
> harness anymore. This way, we can now finally get the output of failed
> tests on the console again (unless you're running meson test in verbose
> mode, where meson only puts this to the log file - for incomprehensible
> reasons), so this should hopefully help to diagnose problems with the
> iotests in most cases more easily.
>
> [*] See v2 here:
>      https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01942.html
>
> Thomas Huth (4):
>    tests/qemu-iotests: Rework the checks and spots using GNU sed
>    tests/qemu-iotests/meson.build: Improve the indentation
>    tests/qemu-iotests: Move the bash and sanitizer checks to meson.build
>    tests: Do not treat the iotests as separate meson test target anymore

What’s the status of this series?  I wonder why you split it apart, mainly.

Patch 1 was already merged, and I took patch 4 today.  So what about 
patches 2 and 3?  They look sensible to me, but is this series still 
relevant and fresh, considering you sent new versions of patches 1 and 4?

(And are there any other iotests patches from you that flew under my radar?)

Hanna


