Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BCC6920D4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:29:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUOQ-0001Qb-VH; Fri, 10 Feb 2023 09:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQUOO-0001QP-PW
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:28:48 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQUOM-0000OS-5g
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:28:48 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so4201713wmb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GdPSkAK9+AypJrKMaf/mtSVb5qSbxBmUidXIMoSe4g8=;
 b=FAsT6WVnnajwR3d7pUDjfEXjb1q8nTautSKSwlORRogDkAeArcYxHFBACOLaUD+dzw
 dRtv1F8TYQmbqH4JRG8SSWb/g92hIMPXafXa56Yz5qkSolFtswRXwNrC9f/Ex3HlLwjv
 xkhSJyoA5WcvRoX+yGN/nsQBbdZj0ujE9jFo9ozLyZ33ZQ/80P48S36FsB0knUs2CfGl
 b4985IUxTnE++4mKng5Q3tle6ZUgz4H7+EOFBFeXyaIBp2wj+OkIkXtWM/l30D7FF2Xg
 xgfekyOA8KHBRCFe2WKry1Vhws+0tfczdimzPYHgt1zdHArSrOqPiCf+A9VobsCzNcs7
 9nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdPSkAK9+AypJrKMaf/mtSVb5qSbxBmUidXIMoSe4g8=;
 b=nHpxRS7xX4XRKbFUERaS4MjRm1YVejhcFmMTtV1T57WZLs1HTYdl4TA1D8NnjdI0/8
 1iGF6slbgu5AQ0Ddr1aQBbn8d42BbiIokPTsxseLtgBvlD9u/nb+rRSAnX0jwXbdOXEz
 fdGuBt6fgYH1VYqydIgQfTEQ+WvmwgM9iyFblSBp7losQAoMJrdDwykRENfeEznc99lo
 jY+k8vNRaU/asku7MAnZABqUJnlLsgnN9lnUCAnEaNSy42bw2uUwrHjlISq4p4bTPLTR
 znLXAwV+FZyWBTSQCPEsMUyMKJWXifn1u1nqVSdN+jC0hadFzLuL4HXGnC01RnljTDDP
 ONOA==
X-Gm-Message-State: AO0yUKWavvhYj5AeQDzMsNpySYTvWLIWtaCuM6Mknexmb9f8+O443AXS
 tUBNZnK910urqPUrJ9FBZA8=
X-Google-Smtp-Source: AK7set+nPWD5kQwy7qJlbD4jXibTa/B3z+MxLVwB8PIsp3jfL2V/9mFRe0XqNUy6wdROdIstRLTW3w==
X-Received: by 2002:a05:600c:4b30:b0:3df:f3df:29b0 with SMTP id
 i48-20020a05600c4b3000b003dff3df29b0mr12815863wmp.14.1676039324686; 
 Fri, 10 Feb 2023 06:28:44 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003df5be8987esm8940828wms.20.2023.02.10.06.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 06:28:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c86380fa-69e6-b589-e83b-0629f35be4cd@xen.org>
Date: Fri, 10 Feb 2023 14:28:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 35/59] hw/xen: Implement EVTCHNOP_alloc_unbound
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-36-dwmw2@infradead.org>
 <9c20c26e-8c7c-8ad2-a339-a30fc98c0ada@xen.org>
 <86f8db7133f4e2fd5a759e8be7e0168318af3005.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <86f8db7133f4e2fd5a759e8be7e0168318af3005.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/02/2023 14:17, David Woodhouse wrote:
> On Fri, 2023-02-10 at 14:13 +0000, Paul Durrant wrote:
>>> --- a/target/i386/kvm/xen-emu.c
>>> +++ b/target/i386/kvm/xen-emu.c
>>> @@ -918,6 +918,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>>>             err = xen_evtchn_send_op(&send);
>>>             break;
>>>         }
>>> +    case EVTCHNOP_alloc_unbound: {
>>> +        struct evtchn_alloc_unbound alloc;
>>> +
>>> +        qemu_build_assert(sizeof(alloc) == 8);
>>
>> Why?
> 
> Because if that builds successfully for both x86_64 and i686 hosts, I
> was right that I didn't need to do any compat handling.

Ok. Fair enough.

Reviewed-by: Paul Durrant <paul@xen.org>


