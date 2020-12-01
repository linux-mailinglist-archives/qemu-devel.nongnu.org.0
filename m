Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE72CA1B5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:47:09 +0100 (CET)
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk47g-0007L9-J0
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk44q-0004kv-LH
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:44:12 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk44o-00038S-VT
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:44:12 -0500
Received: by mail-ej1-x644.google.com with SMTP id f23so3514611ejk.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J/8WbJ0QbX7L8X+aJDfplrJPO+Eempayk1gs8oZ+WVk=;
 b=Sw/i1lI80YpfVf5jJookAHX9tzW2PescyXTPe+nKi5EW8D9BIeXbhcCkQAUKTH2Dyu
 /UfbOzwvKDAthAjZHfbV5MuzZaFb6jtEfFpLNV1GEv7M9OE8wDJaWVfb8jqNBNNsEc5H
 wtrJryXXEo1Z1z1SfuH0tWaJRVzgYTdbepIGqr+HpBpETHsoLG1d0ua6k5EAnIwttGYW
 m5xO3VUwb3RBNwpxu+WpMdytxIq2Ua37iB60JrDwBzaNpbtdU00iVMh6L3Tgji0NA+5i
 yVw4V+A4TSRudg8RdaaakyHIA/hKyU7vCIUqdR6xsq0n6Omo7oQZMYLz3pzI8ugq3K1q
 p6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J/8WbJ0QbX7L8X+aJDfplrJPO+Eempayk1gs8oZ+WVk=;
 b=BdBqINavL2kxXrizCMXSShEIcQ96NseMHmrT/rgp+nN8zWDby1rj2lZY7GT1dZZJjY
 WOaTaf1Av8X1M84L4+t76b5HQOsEYPrRgYVAwx8jAhdmU/XJCq+iUhZR75izCsU5GO/W
 WVqIJYQ1zpUKILitOZ1FiiwAlMCCVwYg7eCh5Zd5TTg7d7ZUZGWcpoXn85egLOghgM03
 rHILsxFwb6FqaGTO+wvflf/lUSEMjMbRUGEDne08DlIoJqs1HLMmZaCWXqQhXGhvtbTD
 0SN0KE7yUh/X3KT6vxXjRgf6p0VsLdukSUgXbDOsVtjyg+CQ/ilFM7qxIAiCXcLy1z7h
 h1ZA==
X-Gm-Message-State: AOAM533uCa64ZeIzebUIq3GRChY5epXV794Y4MoLAWS8gJBTmJV1BaOk
 gFl7UC+D/UxFfFRocRfqfyaPOTb+ATiQMRzAI3i1yQ==
X-Google-Smtp-Source: ABdhPJyuEDp2HeovEehyEAmUd/CclFSMhRjl70vCjfOMMoQYnYue98WSFIhAk5aIymDYvnEwXVuAPF0Dm8MaH7tvnyU=
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr2566040ejd.85.1606823049365; 
 Tue, 01 Dec 2020 03:44:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <2ba88b512ec667eff66b2ece2177330a28e657c0.1605316268.git.ashish.kalra@amd.com>
In-Reply-To: <2ba88b512ec667eff66b2ece2177330a28e657c0.1605316268.git.ashish.kalra@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:43:58 +0000
Message-ID: <CAFEAcA8eiyzUbHXQip1sT_TrT+Mfv-WG8cSMmM-w_eOFShAMzQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] memattrs: add debug attribute
To: Ashish Kalra <Ashish.Kalra@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, ssg.sos.patches@amd.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 19:28, Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> Extend the MemTxAttrs to include a 'debug' flag. The flag can be used as
> general indicator that operation was triggered by the debugger.
>
> A subsequent patch will set the debug=1 when issuing a memory access
> from the gdbstub or HMP commands. This is a prerequisite to support
> debugging an encrypted guest. When a request with debug=1 is seen, the
> encryption APIs will be used to access the guest memory.

So, what counts as "debug" here, and why are debug requests
special? If "debug=1" means "can actually get at the guest memory",
why wouldn't every device model want to use it?

thanks
-- PMM

