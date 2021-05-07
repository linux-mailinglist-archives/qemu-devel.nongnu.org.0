Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C153765AF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 15:00:01 +0200 (CEST)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf05H-0003Qn-Vk
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 09:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leznl-00033T-TD
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:41:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lezni-0008R2-B2
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620391307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aEC0GJ+RbrA4ocwZKDMLvkYgxzvkKLL/vZGNYXimB3E=;
 b=dIAGz8yef3PMWNWxoC4rlNvxDe+jCNysGsJMJNpxAcX89sRaiq5v7PBbBOgHzhN1Ce8XiX
 twchO+lzr9JwwqLt0oCTFBQRCoo/Pd0Dlm2PLRNVQE1/vc7zErqkFeXNLTZBqaTvgqD8c4
 clsbrbQngi2Zx91o6JIotQ0inQf4aLk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-GZpwXu0qOeiV4l3r2jKPpw-1; Fri, 07 May 2021 08:41:44 -0400
X-MC-Unique: GZpwXu0qOeiV4l3r2jKPpw-1
Received: by mail-wm1-f71.google.com with SMTP id
 w21-20020a7bc1150000b029014a850581efso2197152wmi.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 05:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aEC0GJ+RbrA4ocwZKDMLvkYgxzvkKLL/vZGNYXimB3E=;
 b=M/bq8TpGamXuXmjiK5U645Cg17YvslSn3lkvDAOLVDFXy1bd9yICAulIkOJiV6/qmf
 8ictOogjfHtkRt3W0WdpyUjctDQRopy55aFvg4SgMS+83ohuHb8FQKQwuXrcFj7M7bgM
 yVITLdyYkzVEvzIQFgzIKxqcZC7HJ4JP0R2y/d3Gb3fBA6icVuk3g27PkjlbnCsKtmPo
 FTVu8V7WeLMxBJehkCKnd1begIq/TsdZM5PRvkiQSkQDjNT3k7XGDtPKVgIEe9Z4e1Gp
 PdXrTNhnoGZGCnnVCKyO70TStk/dO03K1LszYHMOnKa4EfEwBiWG2cjSHIiMggQDZnER
 h9wg==
X-Gm-Message-State: AOAM532SivE0UqA7cuwxGVb9279+lOHMaoUDO3jHiaoPP/z/oySb/6m8
 8JJ7FDb2Knw5QN99BHjzTw4EG/DFGmywJ9nR0hhHN3LPzLSkTPk0mjNPXgqfee8/LZgKMYPI1Xc
 /soe6qNx50xQol4Zpm+wk76/2mnE4kcPUamfLfK6Q9Ns8SXA8MWGWnpDoAa6/m1ZROfo=
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr12341097wrq.307.1620391302665; 
 Fri, 07 May 2021 05:41:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTGIfq005pB2s3BnzzbxNr/A4b+s51L8rPxylubt3AFNTui3RL8wN5VqO6I+bSEsufdmqG0Q==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr12341061wrq.307.1620391302310; 
 Fri, 07 May 2021 05:41:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v13sm8547261wrt.65.2021.05.07.05.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 05:41:41 -0700 (PDT)
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
 <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
 <CAFEAcA_9o+h29L1Y0BVFhg9JbQbo6A=MgGwCaH_=vt3OhcERBw@mail.gmail.com>
 <c748372a-d585-7777-9dda-9faf33e97e30@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d5bf0064-052e-a0c7-cc17-72db815949e2@redhat.com>
Date: Fri, 7 May 2021 14:41:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c748372a-d585-7777-9dda-9faf33e97e30@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/05/21 11:45, Thomas Huth wrote:
> 
> 
> diff --git a/Makefile b/Makefile
> index bcbbec71a1..3088502329 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -85,7 +85,8 @@ x := $(shell rm -rf meson-private meson-info meson-logs)
>   endif
> 
>   # 1. ensure config-host.mak is up-to-date
> -config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios 
> $(SRC_PATH)/VERSION
> +config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios 
> $(SRC_PATH)/VERSION \
> +                $(SRC_PATH)/default-configs/targets
>          @echo config-host.mak is out-of-date, running configure
>          @if test -f meson-private/coredata.dat; then \
>            ./config.status --skip-meson; \
> 
> I.e. re-run configure if somethings in default-configs/targets changed.
> Does that look sane?

I am not sure if using a directory is reliable (it's pre-existing for
pc-bios).  However you probably can use

# currently in tests/Makefile.include, move it to toplevel Makefile
TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
config-host.mak: $(SRC_PATH)/configure $(TARGETS:%=default-configs/targets/%)

And then if a file goes missing it will trigger the rebuild of config-host.mak.

Paolo


