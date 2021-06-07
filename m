Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319D039DD8B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:23:56 +0200 (CEST)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFEQ-0001Bc-R7
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFCk-0008D8-JE
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:22:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFCi-0006J6-27
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623072126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ligBG8t7toEqlQ4LBakBBJBXAcIpfWM9FfVkfI+tJYQ=;
 b=GKda1tvTdlA/eRKxLm7BPvF8tQPaEC86TOqx0J6NAtOiyGz7yjvcl4CzGqdhz5Ry189rlv
 eDYEPnwHFy8mMpvydUDdfZSHo6IPr8BbRb4dsnCd5+Fk4gV6PRjQCzFTLX1t4ypFfhsKpE
 ux++Q6iFZCRzdTn3siIgYasgZrGHATM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-K35OjY6oPK2GnsokB4iLKw-1; Mon, 07 Jun 2021 09:22:03 -0400
X-MC-Unique: K35OjY6oPK2GnsokB4iLKw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t14-20020adfe44e0000b029011851efa802so7813093wrm.11
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ligBG8t7toEqlQ4LBakBBJBXAcIpfWM9FfVkfI+tJYQ=;
 b=GGUGfi0u0JAvDcf6JF/IplS0rC6XC3f5zMUkFMfxjMRskqbEkvDtgyEBnZSZ4QzHDY
 d7epHA602ZDyjGHZibjhY+9QhK8TNxpIRyQycyDLrIb5py/yp3sN3f/0U0cUB0wOT0kH
 get1SVLeDguz4cs5yd29gVcpvbTmR9BVrH7pLkXYcFL6Obu4GsZbh/fxQRgOR1wbb8D4
 j65XciPcz9oa2vP3Gycu1luTTyQ3cfej1OCXp5j2NZCaWXALq99UFPS0iRTXohkwbAKg
 IUFXqy1SSNGUqlf8yqo9PjQKysYM4fmmbAhxjuPsEd41yLo1Ih0JkkgyuI3c6kRS+YT/
 fmGw==
X-Gm-Message-State: AOAM531Na1nj39jqq7bNC11GUAf65et1ggag/0oFH6MxsfX7ZeE+lG0p
 Xev/uYIPW4v69gRM2g4BiWoGG0EFA/vCrj7IYk5vV5upUGrF0ggeEGCpHZ80EbDrP4klKFq5ptK
 63RO9e4TtkSRwOwU=
X-Received: by 2002:adf:fa48:: with SMTP id y8mr11350875wrr.387.1623072122675; 
 Mon, 07 Jun 2021 06:22:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ5SXZARInTJIDZXVlPKB1IVIAKT3tN8qyzWjZEvdRDnIV8h5sh6X8z6nXswhJ89WgDvcSVw==
X-Received: by 2002:adf:fa48:: with SMTP id y8mr11350848wrr.387.1623072122415; 
 Mon, 07 Jun 2021 06:22:02 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id p6sm16412674wrf.51.2021.06.07.06.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:22:01 -0700 (PDT)
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
Date: Mon, 7 Jun 2021 15:22:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-5-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Use the recently added generic qtest_has_accel() method to
> check if KVM is available.
> 
> Suggested-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>   1 file changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8252b85bb8..7f4b252127 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -26,21 +26,6 @@
>                       "  'arguments': { 'type': 'full', "
>   #define QUERY_TAIL  "}}"
>   
> -static bool kvm_enabled(QTestState *qts)
> -{
> -    QDict *resp, *qdict;
> -    bool enabled;
> -
> -    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
> -    g_assert(qdict_haskey(resp, "return"));
> -    qdict = qdict_get_qdict(resp, "return");
> -    g_assert(qdict_haskey(qdict, "enabled"));
> -    enabled = qdict_get_bool(qdict, "enabled");
> -    qobject_unref(resp);
> -
> -    return enabled;
> -}
> -
>   static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>   {
>       return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
> @@ -493,14 +478,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>   
>       qts = qtest_init(MACHINE_KVM "-cpu max");
>   
> -    /*
> -     * These tests target the 'host' CPU type, so KVM must be enabled.
> -     */
> -    if (!kvm_enabled(qts)) {
> -        qtest_quit(qts);
> -        return;
> -    }
> -
>       /* Enabling and disabling kvm-no-adjvtime should always work. */
>       assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>       assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>        * order avoid attempting to run an AArch32 QEMU with KVM on
>        * AArch64 hosts. That won't work and isn't easy to detect.
>        */
> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
> +    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>                               NULL, test_query_cpu_model_expansion_kvm);

I think this is wrong: query-kvm checks whether kvm is *enabled*, while your 
new function only checks whether kvm has been built into the binary. There 
is still the possibility that kvm has been built into the binary, but is not 
available on the host, so in that case the test will fail now.

Thus please drop / rework this patch.

  Thomas


