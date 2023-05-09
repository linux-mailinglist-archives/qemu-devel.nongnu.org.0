Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44B6FC5DF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:08:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwM7g-0006Ig-3v; Tue, 09 May 2023 08:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwM7e-0006IH-L2
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:07:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwM7c-0007MB-JZ
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683634031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=irx/PuZ3y2rr21dnkxRRYUa0QmRTd6zGDVxsuAMUYCg=;
 b=gVo9MavVA1DZ54vpUHIpYou92DaE0tzOhNC2Zvfzi7bv2mamSh50w/gZF9vAq5NRqtF1CQ
 14ZkVeJ1c/nKQ4F24GknoTVTNmEBlJTZEfUHbsdtctDKBVrQ5POh8q28IA9O7WG+QKogPf
 Ox7RaKvmxEwTr1wNVe2Q1Z6DL+NRlLg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-2NMeLJfDPtSHogpIr_Ojrw-1; Tue, 09 May 2023 08:07:10 -0400
X-MC-Unique: 2NMeLJfDPtSHogpIr_Ojrw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-969ea6699fdso92807766b.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683634029; x=1686226029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=irx/PuZ3y2rr21dnkxRRYUa0QmRTd6zGDVxsuAMUYCg=;
 b=E0IBEIeNUriec8JUclfvkVPxi3RSExlF1gu/olmj+h2lxQ/1Sumy0A3xqUy14ugt9m
 XoX7s7ApFzYvheHv0OZjoFUMrcM4MJFwR5TaIviC+VXfvaU8M3eWyNQgcN7Oi3vu6gCZ
 L2nWMNmKLxPxX4qV89/nSDyOc9EusvOHonkV/vVr9WmGIaXtv02dxjA+jIdD8zelHjm7
 4hC4ftNB43LMav0dOHSehwDUZrzrqIjX7Ckyl86+qoFRsLnL4Dt8lXMR0iNIzfPjbNe8
 BoLcGzkSgfNBQWVQ55u277obc7qsGAFLVBKkbisLMvUWzYtUhZU6Y5y71r50V4nKHgg7
 s+UQ==
X-Gm-Message-State: AC+VfDyFYOifKBMvuUhIIYhK3rb7OQ3pqc1Ec/287d3YkrpI7E19Eczd
 dnNbhi72GB6Y/2ucx8kS0JrHhTtwWNKy0nw/TCFKdB4GMxhD1Ipb825sUpTXSWlNXFWnQIjQ/PO
 PSY/Z5fswhrpDqlE=
X-Received: by 2002:a17:907:934c:b0:966:1d92:5f97 with SMTP id
 bv12-20020a170907934c00b009661d925f97mr7980196ejc.66.1683634028894; 
 Tue, 09 May 2023 05:07:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ53QmtTtc8qdrepWrgFGoF0AiC2kJ6nVzApVLpc3e77DLcyZH6emQhpU/LjxBcEk5QAvbY1WA==
X-Received: by 2002:a17:907:934c:b0:966:1d92:5f97 with SMTP id
 bv12-20020a170907934c00b009661d925f97mr7980175ejc.66.1683634028484; 
 Tue, 09 May 2023 05:07:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 jy11-20020a170907762b00b0094f3b18044bsm1230652ejc.218.2023.05.09.05.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 05:07:07 -0700 (PDT)
Message-ID: <79204af5-6aa9-47c5-56ed-5e356b57c10f@redhat.com>
Date: Tue, 9 May 2023 14:07:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/2] meson: Deserialize the man pages and html builds
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20230503203947.3417-1-farosas@suse.de>
 <20230503203947.3417-3-farosas@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503203947.3417-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 22:39, Fabiano Rosas wrote:
> For the documentation builds (man pages & manual), we let Sphinx
> decide when to rebuild and use a depfile to know when to trigger the
> make target.
> 
> We currently use a trick of having the man pages custom_target take as
> input the html pages custom_target object, which causes both targets
> to be executed if one of the dependencies has changed. However, having
> this at the custom_target level means that the two builds are
> effectively serialized.
> 
> We can eliminate the dependency between the targets by adding a second
> depfile for the man pages build, allowing them to be parallelized by
> ninja while keeping sphinx in charge of deciding when to rebuild.
> 
> Since they can now run in parallel, separate the Sphinx cache
> directory of the two builds. We need this not only for data
> consistency but also because Sphinx writes builder-dependent
> environment information to the cache directory (see notes under
> smartquotes_excludes in sphinx docs [1]).
> 
> Note that after this patch the commands `make man` and `make html`
> only build the specified target. To keep the old behavior of building
> both targets, use `make man html` or `make sphinxdocs`.
> 
> 1- https://www.sphinx-doc.org/en/master/usage/configuration.html

Unfortunately this breaks CentOS 8, which has an older version of ninja:

ninja: error: build.ninja:16369: multiple outputs aren't (yet?) 
supported by depslog; bring this up on the mailing list if it affects you

This was fixed in ninja 1.10.0.

Paolo


