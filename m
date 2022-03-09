Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E344D2D55
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:46:18 +0100 (CET)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtph-0003lm-8U
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:46:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRtkB-0000qp-NZ
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:40:36 -0500
Received: from [2607:f8b0:4864:20::42c] (port=33574
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRtk0-0000gD-HU
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:40:31 -0500
Received: by mail-pf1-x42c.google.com with SMTP id s42so1925343pfg.0
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZDg+rM08FKB/cvJmYnm6/0gVmOkl+aG1NqWKtMgDFvQ=;
 b=AxsfGaNV6Io0vOl3x4gWousiKomn9E6RXkK1qoi5JTo/XjaKJUK0t1+Nkn5QWpaFhm
 ZcZPr/e0fNMnw8llWsxOEn4Gl7jX6AYoZT+OCo8Knq0noDNvEfACnLUZqp+1gWvzKi5u
 A/k9V//BxIyzX2kq17ekNhfP0Yn/eA/zuUcQXzxcZy/M28v/ffTrFSfWINr9S2CRQ5/c
 OG2nfj1KgP5cmD2apyLOOQA2N9/cxNuezg0GElhFVrZgwIUQs1Gkza8Z7wzWy9GLwXd8
 cWOz8ZCpDg0/YTXcEj+MRgSUvMwJXHyylhQievuPBorKXlzdPThTqTk5Oain6QfsVW95
 IeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZDg+rM08FKB/cvJmYnm6/0gVmOkl+aG1NqWKtMgDFvQ=;
 b=AjY/6sd1DZZmtVe+Jekj1DdbAOjWaKBzw9ArqQdZEZPyi6qg4OaCg9e9noxGiAztbp
 TSGBHqiLiFHFGzeSvewsXGQ3YYzhMEMLhrKHzEdFVeiSpfH38xgzHOCaz5ipHqGQOLG6
 P+lfQOQUCSH7fnFS/4FPrr9slNdCTPJVz0Yo19iLUkMW+g1lLs6/Ono+wopDLpxOfa1p
 2ospXteJOyDDN5aLdZ1riyv0ft2F+L+IikXmpvmc1y6gkU4jxMFf71cgZX4OCywUCBpH
 vYZI7aDjx/b9MPzoQE55O0sG5zoTGfttc3WdmVlyu5QCY47vm/qsHHkmeivdrIbEwSj2
 HLlw==
X-Gm-Message-State: AOAM530pPHoAqCNbe4KBM2V30QfI8dKrnzEeDxVyV1ShSj521gMHo+2K
 5AOBYpmAwfMNhWNF0dEdXGQ=
X-Google-Smtp-Source: ABdhPJymVB3Wlt8wgJQ7Jh7fGlTSWYC5grDS/9Pdmku5cM3OAGtLMZ1uvZ3jmHG0PDe8yGEj+nTQyg==
X-Received: by 2002:a65:64d1:0:b0:374:9f3f:d8f5 with SMTP id
 t17-20020a6564d1000000b003749f3fd8f5mr17839080pgv.186.1646822420995; 
 Wed, 09 Mar 2022 02:40:20 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 o5-20020a056a00214500b004bd7036b50asm2442775pfk.172.2022.03.09.02.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 02:40:19 -0800 (PST)
Message-ID: <c7f6ffef-8ce1-6ee1-9ad7-a90ed1b54122@gmail.com>
Date: Wed, 9 Mar 2022 11:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: QEMU device refcounting when device creates a container MR
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing David / Peter

On 9/3/22 11:33, Peter Maydell wrote:
> Hi; does anybody know how device reference counting is supposed
> to work when the device creates a "container" MemoryRegion which
> it then puts some of its own subregions in to?
> 
> As far as I can see when you do memory_region_add_subregion it
> increases the refcount on the owner of the subregion. So if a
> device creates a container MR in its own init or realize method
> and adds sub-MRs that it owns to that container, this increases
> the refcount on the device permanently, and so the device won't
> ever be deinited.
> 
> As a specific example, the usb-chipidea device does this in its
> init method, so if you run the arm device-introspect-test under
> leak-sanitizer it complains about a memory leak that happens
> when the device is put through the "init-introspect-deref" cycle.
> 
> -- PMM
> 


