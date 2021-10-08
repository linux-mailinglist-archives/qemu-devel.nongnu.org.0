Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64F74261A3
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 03:18:41 +0200 (CEST)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYeX2-00014d-Tj
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 21:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYeVw-0000L0-Pm
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:17:32 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYeVv-0006x3-8T
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 21:17:32 -0400
Received: by mail-pg1-x532.google.com with SMTP id r2so1530162pgl.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 18:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Sv6IGJnvfrgKhuNupWL5Ve0ayGVManQmGtF9bMkBl5E=;
 b=MehSN4FSx5hMzFvBN3kFr6rO8TuAV8brSJSmXikHs0jDxKbd2Ilf7ZZlNzN6RqJOM/
 MHOtOyVFisXOhZm7N1VTx/eDxq0hIsE4nAY0w3NYpFLwVtM7iLWu+EkqdpkiWG2vPGUn
 IPOcxlpLtecyKjVD6DctXfCTxOm5rlTG9A6lSbBHncGEemJZLdBDrsxO3Su0TYbbiJ5w
 mkciu7ygNf9AXDX1hc8BhSkdD0wxpTfJOPKFO569T3rMZKZL0FCL/x4/rpideIel0psv
 HFOQnNe+npV/L9Qai9yLxeX1aYoRWcx2qHymW27GW7oWREqVXijkTl2vN982zBZYZwG5
 5RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Sv6IGJnvfrgKhuNupWL5Ve0ayGVManQmGtF9bMkBl5E=;
 b=pWI3TPyXtOP6JRZ2Wzj4oLHbmdvEq5efCCSKc+WnekZ0+dWXunH8E3OaCVSe1XOr5q
 GrEf0pQ3a+3uG0RfCH0hhE9F0McNDg19rfGnfI67Mp92bOa4liFU7MST5RZmCzMwHSVD
 PmoIoj+zm6idARGUU2Y7IEPFl7YZ3MfliuAfU5QAtVHk5EOelpLMdZ7KAHadZOBUNvtN
 UtsuUgIGszwrnUxvWMY8Tv0EfIrI5CsKfU0Zh5AM9xaHyHLhwhXRX1dKTlKykdCAcBGP
 f4EVoIaG7hKdEYWvzT51f+RcjCw2PUNv8LT9o27k0/W75/PjEeqgC45CvQxQBCt0ADnH
 BRkQ==
X-Gm-Message-State: AOAM532Sd623pyzlfdEAJ1rRj+1G9FFpnVTdGdVIGq6SSMXfMqaqBxwN
 wWCTYknvLOOPq+XFuiEwJXEjiw==
X-Google-Smtp-Source: ABdhPJxpfX27uvxCFHm/lTlt1hC4YYV6W13GGi1fjbZwDwY4UY8a55BlfdMmQr7OWXqDKQKg80qOcQ==
X-Received: by 2002:a05:6a00:14d4:b0:44c:cdfa:f8f1 with SMTP id
 w20-20020a056a0014d400b0044ccdfaf8f1mr4228697pfu.58.1633655849491; 
 Thu, 07 Oct 2021 18:17:29 -0700 (PDT)
Received: from anisinha-lenovo ([203.212.240.146])
 by smtp.googlemail.com with ESMTPSA id m7sm521390pgn.32.2021.10.07.18.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 18:17:28 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 8 Oct 2021 06:47:22 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v7 09/10] ACPI ERST: bios-tables-test.c steps 1 and 2
In-Reply-To: <1633626876-12115-10-git-send-email-eric.devolder@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2110080643140.820442@anisinha-lenovo>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
 <1633626876-12115-10-git-send-email-eric.devolder@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 ani@anisinha.ca, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ordering of the patches is wrong!

(a) First, you need this patch so that the test framework will ignore
changes
to the table blobs that you specify here to explicitly ignore.

(b) Then you need the patch that actually contains the test you wrote
(patch
8). Now because you have previously ignored the changes to ACPI tables
that the test would modify, the tests would continue to ignore them and
hence it would not fail "make check".

(c) Lastly, you need patch 10 where you empty out the list of table blobs
to
ignore and update the blobs.

Please also make sure you only update those table blobs that you
explicitly ignored in step (a).


On Thu, 7 Oct 2021, Eric DeVolder wrote:

> Following the guidelines in tests/qtest/bios-tables-test.c, this
> change adds empty placeholder files per step 1 for the new ERST
> table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
> per step 2.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  tests/data/acpi/microvm/ERST.pcie           | 0
>  tests/data/acpi/pc/DSDT.acpierst            | 0
>  tests/data/acpi/pc/ERST                     | 0
>  tests/data/acpi/q35/DSDT.acpierst           | 0
>  tests/data/acpi/q35/ERST                    | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
>  6 files changed, 5 insertions(+)
>  create mode 100644 tests/data/acpi/microvm/ERST.pcie
>  create mode 100644 tests/data/acpi/pc/DSDT.acpierst
>  create mode 100644 tests/data/acpi/pc/ERST
>  create mode 100644 tests/data/acpi/q35/DSDT.acpierst
>  create mode 100644 tests/data/acpi/q35/ERST
>
> diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
> new file mode 100644
> index 0000000..e69de29
> diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
> new file mode 100644
> index 0000000..e69de29
> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
> new file mode 100644
> index 0000000..e69de29
> diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
> new file mode 100644
> index 0000000..e69de29
> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
> new file mode 100644
> index 0000000..e69de29
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523..c06241a 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,6 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/pc/DSDT.acpierst",
> +"tests/data/acpi/pc/ERST",
> +"tests/data/acpi/q35/DSDT.acpierst",
> +"tests/data/acpi/q35/ERST",
> +"tests/data/acpi/microvm/ERST.pcie",
> --
> 1.8.3.1
>
>

