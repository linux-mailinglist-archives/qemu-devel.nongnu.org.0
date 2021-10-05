Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1294230BB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:25:09 +0200 (CEST)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXq3n-0005WV-Oe
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXq2Y-0004dR-Cv
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXq2W-0000VO-GH
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633461827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6GXgADJSn80WyAcxhnUJonTxSh8VA6XQEYzYniOwP8=;
 b=c8SmuEx4s6Mp+vvo4NWiwGgM9VumEKGWNkJ84ER8/164DzgU8Y3M8EAnusmJi4JhCucZIR
 AN7UNmfVbhUuh1yuyZtcMOhifhgQdFHoxy5enERiS3PIQvg7Sb6a/zPTkqiL8pqOZwZ/fQ
 loQ/h0xCky0aa7Ptb1Io6erz4hRKCeI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-wwROzDLiMCmwd9JdOesrww-1; Tue, 05 Oct 2021 15:23:42 -0400
X-MC-Unique: wwROzDLiMCmwd9JdOesrww-1
Received: by mail-ed1-f72.google.com with SMTP id
 i7-20020a50d747000000b003db0225d219so301301edj.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 12:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I6GXgADJSn80WyAcxhnUJonTxSh8VA6XQEYzYniOwP8=;
 b=kNsaTA5AFRDYPgLiazsHOfo8grxh+ou+uOhgS0eU+l65SuOJfozSp0Q0ieEF8lU9ng
 OgxgZ9UQye5reZ6UynqPcQqOtq61bBp00aWgRUZPAugWRLU3gwX8R2Nk24kWWYPDBEDh
 54M84k0HLr6OCIEgQb1vhOtlzRnfOUYja0lCaFs4ADzVnJlTTP9bIRJymji3EHziIG++
 d9XHj3ubjNdXv772xQLpu6iE3LQuxX6eMERsNEj8UzAVpnBMOJHM1j6V4av0WiphjAZz
 0uPxftnQ1xZGk1MgxO+43Awr3+H9np5pdafZPig8JDoxEdscT/zniO61AygA+ISRuHUH
 oOBQ==
X-Gm-Message-State: AOAM530++bZ8t/ufcoNsuVxQyrU19pP5ELoMFOxzXT41F3ACsniJGSze
 GEeYoWytVDGb5GX3Zgn1W/D0lScutJoTl4De51wLGo9phETJ/PloAhw5a6Fd+yh3KZ5ikoeVvxX
 3NrGt0WrZUV67fGE=
X-Received: by 2002:a17:906:1682:: with SMTP id
 s2mr27831612ejd.66.1633461821813; 
 Tue, 05 Oct 2021 12:23:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznjOUnvEqH151iP1kb7rTnkTpaZ7GM0vXSpJcjnB24Omwd4qil/UdebSpyGnC9DHoBGPFmWA==
X-Received: by 2002:a17:906:1682:: with SMTP id
 s2mr27831587ejd.66.1633461821610; 
 Tue, 05 Oct 2021 12:23:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r22sm8032072ejj.91.2021.10.05.12.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:23:41 -0700 (PDT)
Message-ID: <e22db608-8d57-de7b-e9a9-aa062f4fbd7b@redhat.com>
Date: Tue, 5 Oct 2021 21:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <CAFEAcA_pRwZz=cK7=EjTsffhfhkXA-WvfecYWQ16sHYW+yQJBA@mail.gmail.com>
 <CAAdtpL7DesxBWZkjZdrWtSVNuqzqthPR-MMdCCd4LMg+Rnudww@mail.gmail.com>
 <CAFEAcA-+VJgRJjBCaVQak0kq4ruku64riNOESFAse3+ZJdWq0w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-+VJgRJjBCaVQak0kq4ruku64riNOESFAse3+ZJdWq0w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/21 11:54, Peter Maydell wrote:
> True, but "meson.build is evaluated but just does nothing or
> adds files to a sourceset that isn't used" is pretty common
> (hw/pci/meson.build is evaluated even if we're not building
> a system with PCI support, for example).

Selection of files from hw/pci/meson.build is based on per-target 
definitions, so there's no way around when:/if_true:.  (Technically, 
hw/pci/meson.build also as an if_false, so there's *really* no way 
around parsing it).

Instead, when the definition is constant across all targets, it is 
possible to use either when:/if_true: or an "if" as in

if have_user
   util_ss.add(files('selfmap.c'))
endif

or the various "if m[0].found()" found in directories that build shared 
modules.  In this case I personally lean more towards the latter, but 
when:/if_true: is a little more compact so both are acceptable.

Paolo


