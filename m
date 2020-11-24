Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8924F2C24B8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 12:41:10 +0100 (CET)
Received: from localhost ([::1]:56518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khWh3-0001q6-L0
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 06:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1khWg6-0001Km-W3
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:40:11 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:57761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1khWg4-00042h-U5
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=NaxXKGQXF9ioFgvMU1qoRo55IhlXnfGnTGn7ernoD7s=; b=iPXAVhB6RySwkVQGiJ88bVT/M1
 TAiEXlcdxR83U6X89mcIQZrcVGx+ymg5yTOqKU8xG/7/4n5vnSv1mVYxXmV5WnNEfRk5x2re45iIf
 pUoi8RyyuMOB3xG77r2NVutEuzLFo+9vmxcWzW/cUCYrKU+xK07i7Qb0nJhG0A5vm/coV2NEeCjib
 kF8TFqppQb8PpneWzB2xqEstqrRrtUB/WFg5CBSGIVYF5jMtoy6EOYvNfGUboSoNUB0ucA96GwTez
 ci2vU/D38zm/bd2Ne84vGg4PPqkFyOs0u75xFee/OTmX3c+Px5I4YsOhNQMqccd4CgQ3wR5QMSgYg
 5DDe7LfA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 for-5.2] tests/9pfs: Mark "local" tests as "slow"
Date: Tue, 24 Nov 2020 12:40:05 +0100
Message-ID: <4402337.950jYgjXeI@silver>
In-Reply-To: <160620382310.1423262.7364287092069513483.stgit@bahia.lan>
References: <160620382310.1423262.7364287092069513483.stgit@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Dienstag, 24. November 2020 08:43:43 CET Greg Kurz wrote:
> The "local" tests can fail on some automated build systems as
> reported here:
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05510.html
> 
> This will need to be investigated and addressed later. Let's go for a
> workaround in the meantime : mark the "local" tests as "slow" so that
> they aren't executed with a simple "make check" like in the case above.
> 
> Reported-by: Cole Robinson <crobinso@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> v2: - less noisy patch
> ---
>  tests/qtest/virtio-9p-test.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 21e340fa5f43..92a498f24925 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -1456,6 +1456,15 @@ static void register_virtio_9p_test(void)
> 
> 
>      /* 9pfs test cases using the 'local' filesystem driver */
> +
> +    /*
> +     * XXX: Until we are sure that these tests can run everywhere,
> +     * keep them as "slow" so that they aren't run with "make check".
> +     */
> +    if (!g_test_slow()) {
> +        return;
> +    }
> +
>      opts.before = assign_9p_local_driver;
>      qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
>      qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);

Given the short time frame left to 5.2 release, with grumbling though:

Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck



