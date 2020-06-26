Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB04920B960
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 21:39:13 +0200 (CEST)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jouBs-0005pn-8k
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 15:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jouAj-0005PJ-8Y
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 15:38:01 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jouAh-000763-MT
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 15:38:00 -0400
Received: by mail-wr1-x442.google.com with SMTP id k6so10565801wrn.3
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 12:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ZsSAEPLp4bw5RvaNyy7ruh1AxdqurEP2BqKjR4xwilw=;
 b=z03JrDm2HimK5At9qJqIeMsINmvxm6NsRA3nZohP1H7bXq4jB3DIKPkcE90Ti+ELsK
 Nl/XEsCC96kSG43arnZl49yjqVDzO+PrJW31UnYmS5B9ZYdm/UNO9hbZajNO+393pqN8
 OXFRYzIUDyV2Kwm++JoEcwGB8bOMQOZydtPvnQk+PzlA/ZyOr3jqw6jnDmtHqbn0mT+G
 tIy341kndwHxFowpGGteMTefehnixhdJ93I7QrIgUqyjuuccaZBdKoOCwxLX+DbLD8Yi
 2ExHghj834lQlx5/8K4MvRYVaCTp/YUXD51Eci5FFzF77pEMfotl4xP842fah+Gj0zQH
 6wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ZsSAEPLp4bw5RvaNyy7ruh1AxdqurEP2BqKjR4xwilw=;
 b=YJXbywYZjbMtuB0OOzkmZ5TL4k8rN95v/MVUcWXRLVKi6RhMKQZCd0f7F9VlxJMUmq
 egMQsHGvhHPFJWwvA0ApupQRAOafYvkztGKXpGWVWclq1FGhQA0xTnp8HttxmYl4xyvG
 /nMDuL6BZTyt2l8DngWeW8J8SHTTPDjZzphJ47kj1AUS63h1B/Nf9B0YcvIqOOPIkjkE
 bLgMRa1E1iFvQlvtvtUpIJcwd+gmkHC3+bQxMs4G9GIYXWH7caLktmLk1RhK8p2xquvE
 1TS6/hvhGUbMcH/5MGZUkVwGwkiSXEEpXY4I4ZySlHMADSi/vMBIHZom2/iEY1xh2vb7
 DphA==
X-Gm-Message-State: AOAM5308Tdktesjos+hh97kRo3JqDefbqY+G83V6GYEwpTm4qCFv3cMS
 uz6Lfgi6xDveCheibTPvcY9xwg==
X-Google-Smtp-Source: ABdhPJwPs1yQucwDe/bd7nvS4lU3d/hQDzg9pGI9mn9faSKujz4N9yqVSAxncxbIbRRnzUoD17ClLA==
X-Received: by 2002:adf:ee05:: with SMTP id y5mr5462673wrn.185.1593200277854; 
 Fri, 26 Jun 2020 12:37:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x5sm19075587wmg.2.2020.06.26.12.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 12:37:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1F4F1FF7E;
 Fri, 26 Jun 2020 20:37:55 +0100 (BST)
References: <20200622143204.12921-1-alex.bennee@linaro.org>
 <20200622143204.12921-13-alex.bennee@linaro.org>
 <3ab77b68-9f5d-6b99-e226-df4abb186add@linaro.org>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 12/18] tests/vm: allow us to take advantage of MTTCG
In-reply-to: <3ab77b68-9f5d-6b99-e226-df4abb186add@linaro.org>
Date: Fri, 26 Jun 2020 20:37:55 +0100
Message-ID: <87pn9l62jw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, berrange@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, f4bug@amsat.org, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/22/20 7:31 AM, Alex Benn=C3=A9e wrote:
>>          if kvm_available(vmcls.arch):
>>              return multiprocessing.cpu_count() // 2
>> +        elif os.uname().machine =3D=3D "x86_64" and \
>> +             vmcls.arch in ["aarch64", "x86_64", "i386"]:
>> +            # MTTCG is available on these arches and we can allow more =
cores.
>> +            # But only up to a reasonable limit. User can always overri=
de
>> +            # these limits with --jobs.
>> +            return min(multiprocessing.cpu_count() // 2, 8)
>>          else:
>
> And if multiprocessing.cpu_count() =3D=3D 1?
> Seems like we should add max(count, 1) as well.

Or maybe?

   min(math.ceil(multiprocessing.cpu_count() / 2), 8)
>
>
> r~


--=20
Alex Benn=C3=A9e

