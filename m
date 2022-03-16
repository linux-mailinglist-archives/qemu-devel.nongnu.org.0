Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9D34DAF93
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:24:42 +0100 (CET)
Received: from localhost ([::1]:48046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUShl-0000Wt-5v
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:24:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUSYI-0000fZ-Lw
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:14:54 -0400
Received: from [2a00:1450:4864:20::633] (port=42651
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nUSYG-0007Mj-TF
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:14:54 -0400
Received: by mail-ej1-x633.google.com with SMTP id hw13so3689940ejc.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O6KJa9nNentI3RclOSSh5JBMN6VfMlxbPTKRpRRVgQg=;
 b=a6NUuyksiCfeZ/m5VB6fGcCcauAXnbNoaBunaatoOv/8hubW4EU+RJ6VYppuq03XSf
 MjHdq/gCoyA9GODmdCNRsd0qPTdkYrfhZEJSo2L4ImxDBvQoeF1qUpYCwHhlrLpvn+ZD
 zdkVDzoSk0nmtHFOCvH34HGZtZaR10jDO7sCPmZRmfVV7smkd89TyaegAxYvF8qRx2fD
 i9ODXmMs7/t8Mq1e6gc6ETiYsFrMCg+VGxF0siucWTDLC9t3udGDqKGlP5ErRxNzKas5
 N4r/PppMqBUeCy+PXGZQL3HFZnjGNR+CmlCuDasIds52W2RMQc+3HN+cdUYZ6fqHzxLg
 9UFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O6KJa9nNentI3RclOSSh5JBMN6VfMlxbPTKRpRRVgQg=;
 b=PR1/M8GxwsYooJnI46WOpB2PX68vel7stH3whqPYbrHj4Mhe8N1AnkaQ5LtOMJC1zW
 pEmqSrs3iwOQyLrv5CO+qVXb8552SSB6k9KMorCZj4YKuFH+VZ+ByPS9FDd0x6Z8CRdG
 OvOwwhgz/nt2r/+m7KJlI+CEEG9F2Hi9lGZ4FoI/QzrXNpBfrKrVWde4W081nmndhz4A
 4jOWYLli0gS3Dl7ivlITruqOskbI7qC75fVHuQORljuTtNBqXmDlY/Qto7uwCwcOoVSa
 eX+Eb9eGz/zy/nvYnwTuwhoQ3lBfRnFHBlKCyunj+NCV7qvF6IVkulXucJ/4F7uj2uc+
 Dw4A==
X-Gm-Message-State: AOAM5321sOVwJWFUGwgDltMHi0aXv8nKso8oaAXnz/swt685taYpUUom
 QLYilwtNZ/3Ww8MCoktKeKc=
X-Google-Smtp-Source: ABdhPJwd0t7B5N9vKlJSCvMALxBNmnw3Nt63taVyJ3Syx3hInwNtxF9DU0JBIjR1qC/O5X9TiyNjRQ==
X-Received: by 2002:a17:906:974e:b0:6bb:4f90:a6ae with SMTP id
 o14-20020a170906974e00b006bb4f90a6aemr27837551ejy.452.1647432891456; 
 Wed, 16 Mar 2022 05:14:51 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 n19-20020a1709067b5300b006ce36e2f6fdsm818619ejo.159.2022.03.16.05.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 05:14:50 -0700 (PDT)
Message-ID: <835e9fc6-b59e-babe-5a85-80c79535a22c@redhat.com>
Date: Wed, 16 Mar 2022 13:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 0/8] s390x and misc fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20220315112052.515467-1-thuth@redhat.com>
 <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
 <CAFEAcA-C9Y1RKMfDWr132xCvXkoGovU8aK6Z6fjQ9LEZyeUtyg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA-C9Y1RKMfDWr132xCvXkoGovU8aK6Z6fjQ9LEZyeUtyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 20:30, Peter Maydell wrote:
> coredata.CoreData
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/coredata.py",
> line 1003, in load
>      obj = pickle.load(f)
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonlib/universal.py",
> line 2076, in __setstate__
>      self.__init__(**state)  # type: ignore
> TypeError: __init__() got an unexpected keyword argument 'module'
> FAILED: build.ninja
> 
> 
> meson ought to be smart enough to spot that it's got data from an
> incompatible version and just discard its cache rather than
> choking on it.

It tries, but it's playing whack-a-mole with Python:

     except (pickle.UnpicklingError, EOFError):
         raise MesonException(load_fail_msg)
     except (ModuleNotFoundError, AttributeError):
         raise MesonException(
             f"Coredata file {filename!r} references functions or classes that don't "
             "exist. This probably means that it was generated with an old "
             "version of meson.")

I'll submit a patch to add TypeError.

Paolo

