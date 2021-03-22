Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4FB344F23
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 19:54:05 +0100 (CET)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOPgd-00016G-9j
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 14:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOPeD-0007mf-Uh
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:51:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOPeA-0001IX-Fv
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616439083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MS0LdAk6lPYz3Q+wLELtO11qH18rxn73oiWIADpkz94=;
 b=jMYKhtsTGh6c9yBtRPZKnHCbyJAdvOGS9xxFgsrQV+nbzqDxzJwM5nJwg3xzm0EQzSDOEn
 KpMgidd5r5V5CWhi5ei9hdeszDe1oIuR1bur+ROiD5gm/6VFO8f+sbTeXw/ZbQL0wrbLl5
 IHWU3pqu4yzmrowDKXHOaafa3yduRu0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-kVq9OS0BNNuyk_tQlsgZUw-1; Mon, 22 Mar 2021 14:51:21 -0400
X-MC-Unique: kVq9OS0BNNuyk_tQlsgZUw-1
Received: by mail-wr1-f71.google.com with SMTP id x9so26348609wro.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 11:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MS0LdAk6lPYz3Q+wLELtO11qH18rxn73oiWIADpkz94=;
 b=BPbgPdzXCpUhqABRQH8jwSR/2p53RZ2W5Ix0wcRHke6rZ26XW4daXSWqyjjCRjeP7E
 2vDxJSe5FL/9Ee9MKYYW+vqXljCYp0b0od4EuHcm8d8AzPY9KxNIB0yCq3ab/+pXy2oH
 OlyVn4YRUcncEwvJxtbJawXPBZQKRkWSemSYxIzMPggAm/QjcKnhfy3Y/pdEqOz7v0Z3
 6Ily+cQ/WgGz6a829yRevimPBMjPW+V857HDvuD0LTR/PvGeJz2IlPGnDMaJjzNu5xQ1
 wUBOjci5BVO5r/JWH9ZQuXcNnPppU99q0d9OfGcdhrcQO5Fz6PY0t0qm4Zek1ZZqRUMh
 +zHg==
X-Gm-Message-State: AOAM532xcmt+tu/4/k9I8PVVSDFrPYyEYkQtpO/bFvoFVGQI1e6y9Ls2
 Gj3QqVADvBRhgBD1AyxEoGECtyPE26lMDhe1qlbPbtiJpcI7VbHHt630vzovBL120u/9nxStcf6
 8YHRG1VQDkuFHdGyqgibakJxEIiChI2bZ+hOTuV4jHHxr9F66rOU9A9mmKIqKR5qmwiY=
X-Received: by 2002:adf:ed12:: with SMTP id a18mr946438wro.249.1616439079969; 
 Mon, 22 Mar 2021 11:51:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDwXBHuNmjtIfGZ2Tq6LiHWahGTirJNKdt7pENMjj7rBzK6sgZxvfISkQWmCCh3bYH2QB7sA==
X-Received: by 2002:adf:ed12:: with SMTP id a18mr946420wro.249.1616439079743; 
 Mon, 22 Mar 2021 11:51:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u17sm20324929wrw.51.2021.03.22.11.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 11:51:18 -0700 (PDT)
Subject: Re: finding all the places in an AddressSpace that alias a specific
 address
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8wAi6gYOLQG1u8wHS8--9+OENGyKs9mLiufJd9vHYQkg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <14d4a39f-1a32-8d35-4624-b7b73dd0bcae@redhat.com>
Date: Mon, 22 Mar 2021 19:51:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8wAi6gYOLQG1u8wHS8--9+OENGyKs9mLiufJd9vHYQkg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 17:05, Peter Maydell wrote:
> For that I would need to find all the addresses in an AddressSpace
> that alias vecbase, so that we can call rom_ptr() on all of them.
> I think something like this would work:
> 
>      hwaddr xlat, len;
>      RCU_READ_LOCK_GUARD();
>      FlatView *fv = address_space_to_flatview(s->as);
>      MemoryRegion *main_mr = flatview_translate(fv, vecbase, &xlat, &len,
>                                                 false, MEMTXATTRS_UNSPECIFIED);
>      flatview_for_each_range(fv, callback_fn, ...);
> 
> where callback_fn() does:
>      if (mr != main_mr) {
>          return;
>      }
>      do arithmetic with flatview range start and len, etc to figure
>      out the overall address in the AS corresponding to vecbase
>      rom = rom_ptr(that_addr);
>      ...
> 
> Does this seem like it would work ? Is there a nicer way ?

Yes, it should work.  I can't think of a nicer way, except of course 
wrapping it in a nicer that hides the walk.

For what it's worth, it wouldn't be a problem to make FlatRange public 
and export FOR_EACH_FLAT_RANGE as well.

Paolo


