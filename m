Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11D6388CC4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:27:54 +0200 (CEST)
Received: from localhost ([::1]:57952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljKMj-0001UU-UU
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljKKA-0008Rd-Ld
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:25:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljKK1-00072S-Vw
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621423505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taCEy6n5tE89XySCTglPk2FJHfOfbgF/G7VpCEe7WxE=;
 b=FYtSZBW+1bwDnN/euDW8qwWy6bre77D9muXeK9MhsiiZ0g+seMLXFWCjetdTtlq3eth5lQ
 2WIvvjVr9s2Kg16Pvuyv1FIXue2r6KvJ2C44p0gQNqnR0ivrWhj/Rkjk3Yh9wrFnzFK0nJ
 z3u/kiWSDhi1lppkNYZSTz0dGV0Yu1w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-iDXTe_KlP8-whnHnh4_VLg-1; Wed, 19 May 2021 07:25:02 -0400
X-MC-Unique: iDXTe_KlP8-whnHnh4_VLg-1
Received: by mail-wr1-f71.google.com with SMTP id
 i15-20020a5d558f0000b029011215b1cf5cso664518wrv.22
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 04:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=taCEy6n5tE89XySCTglPk2FJHfOfbgF/G7VpCEe7WxE=;
 b=FXFcr75sC40ZQkBQOUnvYDaxD8AasFK/2G54JUYp56YW3sgHCRFBPlCk8lUgGVHloq
 dguinN6rxaHhnEhDhx5HyCRAOCiHxbKu6cqc4ju4Sgs1opq/fb2snapmG5UVSx+dkHf/
 LBf9dZSbnkvFG/uBWjH/SeNb0GXSOfUy2WNNTf2NAw0+JqkL0K1us0Wc9NHl6g+bqbGQ
 dw7DR1k9aXpINO+Q+OndWiq2wktAkHFuAa3JKSbq433awWu3Ijxkvsv/oPo7owJ667MP
 mt6/GYw3FHLaEC14VT+5XmTVep1RH9RRQLGMqO7ntTrVCxk8xJOsm+/znCxiT6lIE9p7
 Vqjg==
X-Gm-Message-State: AOAM530Sp5sDs/FZO47lhOXCuhE0FQqFdi0cOmbzvDqypvZHREtPNDv5
 ciKvHZ9/8s9OkVyMQugu3zAjVkeFaMfK95bsr2vgMLwAnkE/O9XSV4UrEDaraQrtPltcBW9HHaI
 t/IXidaBurVcagI3dtR1bMGnnzIOREJkSgkoKYMAp1gvsmlJopaUUgLQgMj9sViYW
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr14618282wry.70.1621423501115; 
 Wed, 19 May 2021 04:25:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyILWB93RreVkHswV+DmCSJjB1kqjG73uNILNV4OcO+l9PeU/jAM4peqvyA10n77uykMylPHQ==
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr14618261wry.70.1621423500932; 
 Wed, 19 May 2021 04:25:00 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id y2sm15675779wrl.92.2021.05.19.04.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 04:25:00 -0700 (PDT)
Subject: Re: [PULL v3 0/1] Rtd patches
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210514111310.1756593-1-marcandre.lureau@redhat.com>
 <CAFEAcA_xf7CAqEsn5EPSht3+7wOXKvnnQ+OGGp8aDw9A_f3AEA@mail.gmail.com>
 <48378522-0a28-b1c6-2a28-72c85202fcb2@redhat.com>
 <CAMxuvayho0Lgyejz8KPCDfmsbHZE9ANMdKv+NCdooUHoaJyY4Q@mail.gmail.com>
 <CAFEAcA97jb9pkpCOXYAHxhcxFU1KnQG4UKHvsY8wE1zCdtGVqg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <04f0a761-194e-5c0e-00e5-7fc03d2f2d54@redhat.com>
Date: Wed, 19 May 2021 13:24:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97jb9pkpCOXYAHxhcxFU1KnQG4UKHvsY8wE1zCdtGVqg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

On 5/16/21 6:03 PM, Peter Maydell wrote:
> On Sat, 15 May 2021 at 20:02, Marc-André Lureau
> <marcandre.lureau@redhat.com> wrote:
>> Otherwise, you should get a warning and doc will be disabled. Mine is less
>> ugly than yours, not sure why:
> 
> I think that's a sphinx-version dependent thing. I requested that
> they improve the support for conf.py raising ConfigError to produce
> nicer error messages in https://github.com/sphinx-doc/sphinx/issues/7108
> but if your sphinx is too old to have that improvement then you'll
> get a warning message with the backtrace.

Ah, probably, the issue #7108 appears to be merged in milestone 3.0.0,
and the version installed on Fedora 32 is:

$ /usr/bin/sphinx-build-3 --version
sphinx-build-3 2.2.2

Thanks,

Phil.


