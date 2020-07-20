Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E7225E1E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 14:06:09 +0200 (CEST)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxUYZ-0005fR-RA
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 08:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jxUXb-00059a-9L
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 08:05:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48323
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jxUXZ-0000G3-Df
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 08:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595246704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Cg23akAEg6MnwycEUX++s0UJdJdZv3bPQZMVz2p5OB0=;
 b=FnGSpAAciDU2WQr5AmCXTEguBJYeefRPefAJ9QZ55C9v161h05WcbRQxFvte8nwwKfGwOQ
 xG7c6WySAygBA2H0BN+FYiKDJiahLayJO9czDb5+4s2hkVCO6EREEg2VsSf2BeMQb+MEc5
 aA7TM69rdc1k0iBg4UxQJvD7J3K6iEk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-CR3wXi1pP2eEel_M2YttXw-1; Mon, 20 Jul 2020 08:05:01 -0400
X-MC-Unique: CR3wXi1pP2eEel_M2YttXw-1
Received: by mail-wm1-f69.google.com with SMTP id e15so14148790wme.8
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 05:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cg23akAEg6MnwycEUX++s0UJdJdZv3bPQZMVz2p5OB0=;
 b=pSuJqmXlL4MUEFTeyubrUple5PlS4gh2LTXt4b1OxwBPx2IlmNA7Sfj1fQ+Kcjrrve
 iv7N6M72Uria3QqMpTU/ii/H/DIAJJXDNsEtrx1XLxaVCDuDbWSME6fccNAdDp3ds5m0
 kkwYDBNLNLzr4hzM8Ol4eZRTUWkJsE5A8D685U8y1EGk9MqoRP8tL+CPUpZIgbgPdCzW
 QGcI/K3JyjJYH6S2Zc4H/Civh7+tAwZs3s0QTE5KuGpEIqd/9t8jF+pYSCz3Ph98sKxG
 LwJnRIZjgNQN1XOP6u21r+Wo4sOLnPUJVXxMbPj/yWcqnzwDKc5PHNQvHSiiM5NZaPhG
 xJRA==
X-Gm-Message-State: AOAM532yek62x2YqzVBZz07XBoavfV6Osfdk0Uu7tqNi7tLMvIqYbVds
 9ub6GvIIHHiJG3cDo3QsFGlgGLnMLhmcOIWHNfjbQcNJPlMOA6Q9p9QB7FYOpoo17opC/IzHdsd
 YxowktYHMuBy9a0w=
X-Received: by 2002:a05:6000:1290:: with SMTP id
 f16mr23406333wrx.66.1595246700427; 
 Mon, 20 Jul 2020 05:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ6+cixazceWr9wwVkPJ/oQZrtegU4l/weQIEThPU2t47v118+tXitVmnt8VyqHecEhGoyNA==
X-Received: by 2002:a05:6000:1290:: with SMTP id
 f16mr23406322wrx.66.1595246700193; 
 Mon, 20 Jul 2020 05:05:00 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id w7sm30704891wmc.32.2020.07.20.05.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 05:04:59 -0700 (PDT)
Subject: Re: VMState in QEMU
To: Pratik Parvati <pratikp@vayavyalabs.com>, qemu-devel@nongnu.org
References: <CA+aXn+EE2s55Y9gKUpckW_skw5sgonniPuEOFTjC+i1-dcWQyw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <14bd4805-f976-597b-0739-d6c037459c40@redhat.com>
Date: Mon, 20 Jul 2020 14:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+aXn+EE2s55Y9gKUpckW_skw5sgonniPuEOFTjC+i1-dcWQyw@mail.gmail.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 02:11:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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

On 7/20/20 12:58 PM, Pratik Parvati wrote:
> Hi team,
> 
> Can someone please explain to me briefly the significance of VMState in
> Migration.

This is documented in docs/devel/migration.rst. Which part of
this document is not clear enough to you? So we could improve
it.


