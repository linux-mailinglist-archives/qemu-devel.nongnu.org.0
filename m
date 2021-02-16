Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F7731CB5E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:44:54 +0100 (CET)
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0er-0001uv-DM
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC0e3-00017N-Lm
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC0e1-0002np-2g
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613483040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJNZZRhh/sOAte9eZWAATmhl3bdb9JxswfLzCoKu4ec=;
 b=TBRtu56Q25DLFAmmF8BlVzPmNvkA7tYzoDTECpoVbWHb05tMm1N+3PNofD4pO1lLorDcVP
 9u3gpoHt3+8VLKJhl+W7XuuAZDWn2jha4/9Qo8UhYDkR8Z6cdhjumuGudpbj4UalLVHHVm
 At7b3EPhA0fxucab+emzwFMgXailyWA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-8vv-ZaGaMXWi1gkYq4qSGg-1; Tue, 16 Feb 2021 08:43:58 -0500
X-MC-Unique: 8vv-ZaGaMXWi1gkYq4qSGg-1
Received: by mail-wr1-f71.google.com with SMTP id o16so13423641wrn.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 05:43:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MJNZZRhh/sOAte9eZWAATmhl3bdb9JxswfLzCoKu4ec=;
 b=romHJIJHePR4Ezvb8bmPE69JENcPQxV5femzeHOLSce9jlq0F/uzCt3lOnh6J9GViO
 GRYoXWMFtcEEmHhXuXEFbrT+6MEPDynDvl9VulCMC4FYZ7LEnAu9mx0OeYiFnlDaU1iR
 iP2kOzWCoo7vH8tL5YXlFwcgV1ZiadnLG0P1uomwIjppBTUjr7rDCXrh2BX/fXjjOYqe
 I9bVdDwXPKIEJnvLZacgLlNOim8bRIoak07F4QMIcNWLbxwF7Qy7GTJGnTr4+IlBqXNO
 /wcnRynqAz+CTTnDpPgfQM4EtAiAnbxcEkWzR44EEk3ts6MmFj/CD/FNueGp9jGbDMC0
 m1gw==
X-Gm-Message-State: AOAM533f/b65mc5Yx1wGvoEzQLlmhTwSmLvwsqQBHikBe89F5lbLIOx4
 i6ArgWxNoDNUaT4DSUf3ICfOaFKYSfXIZRp4+swIg7/SnfT0tA6NXLlKCBAb9PgXOHy7sVC+gVo
 WSkBKcHRnr6H03qgYBo2fdb+mOG7/tYXAdKAgnlMO8NyoffgH/nyXOocEN0s3YmeKrAM=
X-Received: by 2002:a05:600c:4c11:: with SMTP id
 d17mr3471045wmp.86.1613483037512; 
 Tue, 16 Feb 2021 05:43:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxq23flMtgksDDUv2217nYw9E2t3sZa7vvEm1zNtAtGBLWQUPpajtwIuNMPJw8exRY+jSxSIg==
X-Received: by 2002:a05:600c:4c11:: with SMTP id
 d17mr3470868wmp.86.1613483034653; 
 Tue, 16 Feb 2021 05:43:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d5sm29933380wrb.14.2021.02.16.05.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 05:43:54 -0800 (PST)
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
 <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
 <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
 <1a8f0b62-0adf-9360-2365-e9881a6aef94@redhat.com>
 <CAFEAcA8VCGmqbdLFLQ0R9Uun4MzxLTnOZExmYJZ65qZ_fjDUvg@mail.gmail.com>
 <f61447bf-f556-b626-4a6c-f86e724b0f7f@redhat.com>
 <CAFEAcA9G7CQDPb1QNaajwG5wSdND-E5nkTox1yEocdsBDsfc3g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9f9999eb-66a5-3fe4-64fe-41f64edb49ff@redhat.com>
Date: Tue, 16 Feb 2021 14:43:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9G7CQDPb1QNaajwG5wSdND-E5nkTox1yEocdsBDsfc3g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/21 14:36, Peter Maydell wrote:
>> My first submission of this patch even special cased "-chardev" to hide
>> the warning, but this was dropped in response to reviews.
>> (https://patchew.org/QEMU/20201103151452.416784-1-pbonzini@redhat.com/20201103151452.416784-5-pbonzini@redhat.com/).
>>    I can add that back if you prefer, since it's very simple.
> I agree with Daniel that it would be better to be consistent about
> whether we like these short options or not, but disagree that
> the answer is to deprecate everywhere:-)
> 
> Broadly, I think that being able to say 'foo' when foo is a
> boolean option being set to true is obvious and nice-to-use
> syntax, and I don't really want it to go away. 'nofoo' for
> 'foo=false' is much less obvious and I'm happy if we only
> support it as a special-case for 'nowait'.

It really depends on what the default  "-M pc,nographics" arguably makes 
sense too (more so than "-M pc,graphics" since true is the default). 
Likewise for "usb", where the default even depends on the machine type.

How do you propose to resolve the issues and ambiguities in the grammar?

1) due to QemuOpts not understanding types, you can specify "serial" and 
get "serial=on" instead

2) with a parser that understands other types than strings, you would 
not be able to specify "-M kernel-irqchip" because it would be converted 
to the boolean "true" and not the enum "'on'"

3) one is not be able to specify "-M pc" -M usb" because the second 
kernel-irqchip would be interpreted as a machine type?

Thanks,

Paolo


