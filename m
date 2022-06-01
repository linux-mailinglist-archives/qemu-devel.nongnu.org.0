Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C60553A1FF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 12:08:55 +0200 (CEST)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwLHa-0007KZ-Kg
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 06:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nwLFh-0005ko-LO
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nwLFg-0005Wt-4f
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654078014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIc+I4Vf2FJK/QFxzUV8h+Kvr5bgHUhrQzJK4RFcD8U=;
 b=QrrhxuLHuwAYbVTtQ+gT99K7faA4am9KlvHB9kVPbLTGQmTAdhalhJlYCTDk8CRYfVpvg9
 K3lp14drBUgkYZo7nNNT29hOBoWu3qXDuxgpmgVS50cweuV1UYJqWdoc+JBLvNP/t0qYZN
 1SD+gdaaoYFtvT/k/z45vpxkVS2je5E=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-SZ_4i4a4P7uh_kkPdqDE7A-1; Wed, 01 Jun 2022 06:06:53 -0400
X-MC-Unique: SZ_4i4a4P7uh_kkPdqDE7A-1
Received: by mail-ej1-f69.google.com with SMTP id
 gh15-20020a170906e08f00b006fea2a22319so688950ejb.20
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 03:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NIc+I4Vf2FJK/QFxzUV8h+Kvr5bgHUhrQzJK4RFcD8U=;
 b=L6aekAzvabiE5yD9LDaLUvZ7ZUZ4UBE+j2tARgds/8Q1U67zBxE849OmAUQoZ8+jc8
 JpKtLzI5iedZ35G7bnXBke2RudvTB/ZV6VBcpYriBMoITDr3y05ky02KkHe9KMjcilV+
 WbuHGi7TKmVKXVJ/rvRzVImaCmhnmQYwbSrETthJ8o1ec7x8uEUInaiFBR0bg57pBZu2
 trgmA0+BN5UQQ34ykqHe+/ABNp5kwaP8D/91B2WtBm/EF70MlbQt/GmtLhKDCAX1lUZB
 6qChIiUkhgQmVefXRfLMdUMYk1mV7uTW4XHdESeCyCcaTgQreR8grd9U6NVgABAQYIDG
 VvrA==
X-Gm-Message-State: AOAM533GqCAoTQifvnrSXjFc3MuVgiaiTa/Z215RQJ28NWznoFVhiB8h
 uy7/VBqmGjEycBssVQ5cRUd5QfAVE+UXE90Kmm/bw0FCLzk9qUJhEpYH0fQPWA5Wk7LPvGq1lEx
 /apKIx8TDi3jUFZo=
X-Received: by 2002:a17:907:3f0f:b0:6ff:11b7:f037 with SMTP id
 hq15-20020a1709073f0f00b006ff11b7f037mr31064222ejc.253.1654078011980; 
 Wed, 01 Jun 2022 03:06:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+1eRf/8glCjzKyPt7qe8q3kCI6F8+ookC2E61MAChN/JgGM4dsxqeOfo2HnHgkpo6KYnopw==
X-Received: by 2002:a17:907:3f0f:b0:6ff:11b7:f037 with SMTP id
 hq15-20020a1709073f0f00b006ff11b7f037mr31064193ejc.253.1654078011702; 
 Wed, 01 Jun 2022 03:06:51 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 vz22-20020a17090704d600b006fedcc56b0bsm517574ejb.170.2022.06.01.03.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 03:06:51 -0700 (PDT)
Message-ID: <8df98517-56f6-f7b0-2af8-6dec404ece79@redhat.com>
Date: Wed, 1 Jun 2022 12:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/9] tests, python: prepare to expand usage of test venv
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <CAFn=p-bqUqEZW0wcccCOHut=wXQTcVsWX5kRkAPe2u6eSM0DPA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFn=p-bqUqEZW0wcccCOHut=wXQTcVsWX5kRkAPe2u6eSM0DPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/22 16:27, John Snow wrote:
> Paolo: I assume this falls under your jurisdiction...ish, unless Cleber 
> (avocado) or Alex (tests more broadly) have any specific inputs.
> 
> I'm fine with waiting for reviews, but don't know whose bucket this goes to.
> 

I thought it was yours, but I've queued it now.

Paolo


