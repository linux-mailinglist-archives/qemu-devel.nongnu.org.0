Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1825827DD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:40:37 +0200 (CEST)
Received: from localhost ([::1]:57600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhHA-00069v-2r
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oGh6Y-0004yT-86
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:29:38 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oGh6V-0002Fl-2g
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:29:37 -0400
Received: by mail-wr1-x434.google.com with SMTP id h9so24224750wrm.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=za+XFaxYM1zjp716YegZdTkj9nfX0PGGnKcdUSnInXI=;
 b=kJPjOMwQ3Z/dYWEXV1KXKYOVWZBWPnhq3biLtaYX9HmlgQUrBSQIt1yy/7KxGAdTnN
 p7O/kA/f5imkz7lI11e+ZNWYLUJkr6JgaRrEsXhGpDJ7LwcXQjIbG3/el90M63J7TrqO
 nBoy7pU8+XK2c2Bo4wEWw3BldLurUNyHSt14hlV/zGMmfPT6VFAKtfl6xyI7p8rQyZKI
 boOeSJRq2FsoFUvAZyfvhduNvIq3Sgrm0vPzSS1o2wxOtGagfMKh9U5+EsvKY789wIlW
 kTv3VwMrINzJE6NLZ8kkay74gF8OM9N5RIWLRTBzxec+T5Gw2SlgexgPy1QySjFuRMa9
 TXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=za+XFaxYM1zjp716YegZdTkj9nfX0PGGnKcdUSnInXI=;
 b=dmCZtTmJgNBJjSxG+d6hT/L0219Dh4ytJcYGSjE2KCM2WXKdj8Ma4kEgCXLqmRXmi/
 kAYOBpxjFsYlg05wdmTRyEUANT6/PgeQTh7crq7cs+3mVt+LkEJ7xG9dM+BxpN1DpC89
 TDwqp5U/zsY2Pc2Bq8JzWyzbedtgqi0+SWWHTj5fUSEnZ0SkTAwOTNE6h/V+ABLYxJQU
 bWLBOtc6NgMlYpGkd5o2qVHgcVEpk0XqRDWhBABfcYHRVisJdG3L3gwIShX3DlhZiptP
 94D/5CwjjZraz4u4lOeHOsj/lnqZcgXsXUNC3PVpwi97dnQbGm2RNpp2ca1FHZHCJWqi
 3xKw==
X-Gm-Message-State: AJIora941VbBCYwaoecwypCsy69Hxv1prP12/eH8PtxpJ+9quQP2O+ws
 Jh59d8/4ljxQMkuJ2Ao6DYRgbg==
X-Google-Smtp-Source: AGRyM1selepMuzBeuxylAV6r2rVbKEd8nt0zs80xv/IlqJkz8eZtBsyLk9cKkX7BLZhOLgnVMfmVWg==
X-Received: by 2002:a05:6000:1888:b0:21d:beeb:7873 with SMTP id
 a8-20020a056000188800b0021dbeeb7873mr14201528wri.393.1658928573408; 
 Wed, 27 Jul 2022 06:29:33 -0700 (PDT)
Received: from [192.168.0.17]
 (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net. [86.15.83.122])
 by smtp.gmail.com with ESMTPSA id
 a7-20020adffac7000000b0021e3e73dec6sm20329302wrs.72.2022.07.27.06.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 06:29:33 -0700 (PDT)
Message-ID: <a8962df7-cbf8-3134-9160-7c5d45e91215@sifive.com>
Date: Wed, 27 Jul 2022 14:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: updates for designware pci-host
Content-Language: en-GB
To: Peter Maydell <peter.maydell@linaro.org>, Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
 <20220727111320.5b7qobwx5bbwh65d@hetzy.fluff.org>
 <CAFEAcA_aw002ZP6a=M5VyjVSs9Ln-Pv3ED0-eTtJj4bFM+KcJw@mail.gmail.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <CAFEAcA_aw002ZP6a=M5VyjVSs9Ln-Pv3ED0-eTtJj4bFM+KcJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ben.dooks@sifive.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 27/07/2022 13:56, Peter Maydell wrote:
> On Wed, 27 Jul 2022 at 12:15, Ben Dooks <qemu@ben.fluff.org> wrote:
>>
>> On Wed, Jul 13, 2022 at 05:54:42PM +0100, Ben Dooks wrote:
>>> As part of a project we have been looking at using the DesignWare
>>> PCIe host. We found a few issues of missing features or small bugs
>>> when using this with a recent Linux kernel (v5.17.x)
>>>
>>> Whilst doing this we also made a start on some tracing events.
>>
>> Hi, has anyone had a chance to review these. If so can this series
>> get applied? If not should anyone else be added to the review list?
>>
>> If it would be easier I can try and find a git tree to publish this
>> branch on if a pull request would be easier.
> 
> Is there a public spec for the hardware? There isn't anything
> listed in the source file in the tree. Without the h/w specs
> it's pretty difficult to review changes.

Would it be helpful if i put out a v2 series with pointers into the
Linux tree to where the info is available there?



