Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3304D9B94
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:49:47 +0100 (CET)
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6cU-0006wr-Q8
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:49:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU6ab-0005Eq-L2
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:47:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU6aY-0006Rv-62
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647348465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3Iv3neB/KUlr4QTVuCuSFuw4jFM6/q1z9lh++ZB1+0=;
 b=GPJNz+tIheQ6AfMYWlenGzAL46X5yErnS6NUNPcRVGB7DgSG4dkEsmulC65dYfMOvfNaAs
 r7dTcBB0BUyuej2J3XwXCQUKMXzQXotiOzCTWNlOuj+DOMqAi6cPbEsHAHCKKAh/oWAkm8
 mNsXoKKEhbtlPmVWWyNMi1kaEj0MRLE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-VBOMYbOeNg6ydUI5UrUu1w-1; Tue, 15 Mar 2022 08:47:42 -0400
X-MC-Unique: VBOMYbOeNg6ydUI5UrUu1w-1
Received: by mail-wm1-f70.google.com with SMTP id
 l10-20020a05600c27ca00b0038b85cf8a20so887191wmb.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f3Iv3neB/KUlr4QTVuCuSFuw4jFM6/q1z9lh++ZB1+0=;
 b=SjbDv+NP8FdtOamINcQM3jVoN9TNo/Z88YPUmLBs4w8gnZRbzOEG9jfHl7tNmDJZdG
 k82WXwRArOe5RNuDHtdqHN2HB6tikHTbNhFeRXzLFMG6RdCzflSSZvRmuD/VWvr7/kwI
 q377XeyqcJgXlgLt7bjBV7j0Gqq42aKN8Rdw0lLh/wAXThW6HFTqZh3zg8IeMBGFSLRt
 G5xqzHgU4v4MJhb6F1znbnP88xu/Yt3YUF9oTivrMrJgGpdt2z6zDFG+3mJMcgYlZAfP
 jI6u5JWy8J4j7lWFHm+G8Rn8SBPHgJ7HmlbiRtBbmoiN/3u1ZCJEfusYU+xlYW8oKHTL
 jW3A==
X-Gm-Message-State: AOAM532uJh4OtvYg05v7iyfg8lPOLgc4KrIUceXd+D6t2UjlVQl4en/E
 BEtGedGj65FHyxJBRIzpg+i9fFmYYxVHf6pfEb0gp1q7mqqVSCOWAYi+2iURO5OnZDM8y77YkEA
 I/OnelYabQweYfss=
X-Received: by 2002:a5d:4bcc:0:b0:1f1:d6f8:89f5 with SMTP id
 l12-20020a5d4bcc000000b001f1d6f889f5mr20131257wrt.713.1647348460845; 
 Tue, 15 Mar 2022 05:47:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWqbKLFu6TWoG8YSJhbdvEE1JmNQs5jbEldm9whPbebP0dYbh4sLKPNNI5LGvGY7xLR4bv7w==
X-Received: by 2002:a5d:4bcc:0:b0:1f1:d6f8:89f5 with SMTP id
 l12-20020a5d4bcc000000b001f1d6f889f5mr20131236wrt.713.1647348460547; 
 Tue, 15 Mar 2022 05:47:40 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d46c2000000b001f079ba0158sm15278841wrs.60.2022.03.15.05.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:47:39 -0700 (PDT)
Message-ID: <89c85796-9853-e2fe-977b-2ab321c29af5@redhat.com>
Date: Tue, 15 Mar 2022 13:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/3] docs: rSTify "security-process" page; move it to
 QEMU Git
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 qemu-security@nongnu.org
References: <20220314104943.513593-1-kchamart@redhat.com>
 <20220314104943.513593-2-kchamart@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220314104943.513593-2-kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, eblake@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/03/2022 11.49, Kashyap Chamarthy wrote:
> This is based on Paolo's suggestion[1] that the 'security-process'[2]
> page being a candidate for docs/devel.
> 
> Converted from Markdown to rST using:
> 
>      $> pandoc -f markdown -t rst security-process.md \
>          -o security-process.rst
> 
> It's a 1-1 conversion (I double-checked to the best I could).  I've also
> checked that the hyperlinks work correctly post-conversion.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04002.html
> [2] https://www.qemu.org/contribute/security-process
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/devel/index.rst            |   1 +
>   docs/devel/security-process.rst | 190 ++++++++++++++++++++++++++++++++
>   2 files changed, 191 insertions(+)
>   create mode 100644 docs/devel/security-process.rst
> 
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index afd937535e..424eff9294 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -48,3 +48,4 @@ modifying QEMU's source code.
>      trivial-patches
>      submitting-a-patch
>      submitting-a-pull-request
> +   security-process
> diff --git a/docs/devel/security-process.rst b/docs/devel/security-process.rst
> new file mode 100644
> index 0000000000..cc1000fe43
> --- /dev/null
> +++ b/docs/devel/security-process.rst
> @@ -0,0 +1,190 @@
> +.. _security-process:
> +
> +Security Process
> +================
> +
> +Please report any suspected security issue in QEMU to the security
> +mailing list at:
> +
> +-  `<qemu-security@nongnu.org> <https://lists.nongnu.org/mailman/listinfo/qemu-security>`__
> +
> +To report an issue via `GPG <https://gnupg.org/>`__ encrypted email,
> +please send it to the Red Hat Product Security team at:
> +
> +-  `<secalert@redhat.com> <https://access.redhat.com/security/team/contact/#contact>`__
> +
> +**Note:** after the triage, encrypted issue details shall be sent to the
> +upstream ‘qemu-security’ mailing list for archival purposes.
> +
> +How to report an issue
> +----------------------
> +
> +-  Please include as many details as possible in the issue report. Ex:
> +
> +   -  QEMU version, upstream commit/tag
> +   -  Host & Guest architecture x86/Arm/PPC, 32/64 bit etc.
> +   -  Affected code area/snippets
> +   -  Stack traces, crash details
> +   -  Malicious inputs/reproducer steps etc.
> +   -  Any configurations/settings required to trigger the issue.
> +
> +-  Please share the QEMU command line used to invoke a guest VM.
> +
> +-  Please specify whom to acknowledge for reporting this issue.
> +
> +How we respond
> +~~~~~~~~~~~~~~
> +
> +-  Process of handling security issues comprises following steps:
> +
> +   0) **Acknowledge:**
> +
> +   -  A non-automated response email is sent to the reporter(s) to
> +      acknowledge the reception of the report. (*60 day’s counter starts
> +      here*)
> +
> +   1) **Triage:**
> +
> +   -  Examine the issue details and confirm whether the issue is genuine
> +   -  Validate if it can be misused for malicious purposes
> +   -  Determine its worst case impact and severity
> +      [Low/Moderate/Important/Critical]
> +
> +   2) **Response:**
> +
> +   -  Negotiate embargo timeline (if required, depending on severity)
> +   -  Request a `CVE <https://cveform.mitre.org/>`__ and open an
> +      upstream `bug <https://www.qemu.org/contribute/report-a-bug/>`__
> +   -  Create an upstream fix patch annotated with
> +
> +      -  CVE-ID
> +      -  Link to an upstream bugzilla
> +      -  Reported-by, Tested-by etc. tags
> +
> +   -  Once the patch is merged, close the upstream bug with a link to
> +      the commit
> +
> +      -  Fixed in:

There used to be a "<commit hash/link>" after that "Fixed in" on the 
original page, seems like you've lost that somewhere along the way?

Anyway, I'd like to hear from the security folks whether they are OK with 
moving this page to the main git repo, or whether it rather should stay in 
the qemu-web repo.

  Thomas


