Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A149C29F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 05:28:30 +0100 (CET)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCZv2-0007Oa-K8
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 23:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCZs6-0006BL-Lu
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 23:25:27 -0500
Received: from [2607:f8b0:4864:20::636] (port=34632
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCZs4-0000Ij-TE
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 23:25:26 -0500
Received: by mail-pl1-x636.google.com with SMTP id h14so4487106plf.1
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 20:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HU16QpEBEzUP7XLpKUCCoi7g+RUBriAXz7zBxEAFSWg=;
 b=LAlPZuZJyDWu9yeaLr9vwXabnHTkvGx6CnrajxRl4GyiXQSawH9VF0c3KJ7YRuA+xp
 gwsMXA9TNdSduQGdvA77847ElWFuV/jVnxjGQTTiu4QmtsBTto4L+CTETx5sJobDeblj
 McJcuyczQft9JRbW3Kp52QZeYbOnFIPhgNjxf8NYHBKXFfQhok6PY5ckA81qVRb3u/zU
 stZu7HErGM9ibp6f1M/gElw2eNf7J4q+QTJBYVEXLnfMtMk0d2p8fRFjMP//3ATp6wC6
 4KJP0IhAVa8PMgK3sjdSBvsoiSwJ/bSNFhsdNVw24boRd0wEnAn/QEUCefMI4/uEGglI
 2E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HU16QpEBEzUP7XLpKUCCoi7g+RUBriAXz7zBxEAFSWg=;
 b=DaVM+8UuRgPfQW4KhY+ir0KkVcEoDLV22OWZgE9RBktnrnU85RO3l6Wf+wwlTfNKpi
 21aBfKb0a0OnBDIwA6445QpGDKmIMUFHHTU8KMcCuFy3cgJ+qIkIhJjRPPSF1duzpkEz
 421fBPNRlztBtzAc68eIP3lPJzKhtUMKltosFMEsmjvUEZSrZUzi+wZEXh4T1ACtEuI4
 uRoJoAvY8oxpUQygy420/FXipeEcW4+GcjEPAkchcv9fEOvXjUm4W6IqkKC3iBf5LQ79
 fboUSlkvBXYnUJ3NJWFHp1L3IeUkD5z5suuAIZJDlcq3dXq4ItSTix/b4AQp5QuYo4FB
 e3yg==
X-Gm-Message-State: AOAM530zwNqXe40gVSmrQ/XI5pAkG5fIeR0SRmLlLbSw9WAR0MiQ2wtI
 LqxFqr2e76Xote01CDLIYNA=
X-Google-Smtp-Source: ABdhPJz6WzKF4hMmSoz8nQZWhwevkPfY4ZbD+MycplpXIrsbv175Cl7hagQ8GVUr6y02/Gbyeo2jug==
X-Received: by 2002:a17:902:9a02:b0:14a:6a3:6c68 with SMTP id
 v2-20020a1709029a0200b0014a06a36c68mr21431933plp.138.1643171120846; 
 Tue, 25 Jan 2022 20:25:20 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z13sm531585pfe.20.2022.01.25.20.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 20:25:20 -0800 (PST)
Message-ID: <4308fbe3-042b-6311-5cc7-8c51710aef86@amsat.org>
Date: Wed, 26 Jan 2022 05:25:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v5 18/18] vfio-user: avocado tests for vfio-user
Content-Language: en-US
To: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, marcandre.lureau@gmail.com, pbonzini@redhat.com,
 bleal@redhat.com, berrange@redhat.com, eduardo@habkost.net, mst@redhat.com,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com
References: <cover.1642626515.git.jag.raman@oracle.com>
 <f7280fecf94e4d77498af62b11f26a2a5043e5b4.1642626515.git.jag.raman@oracle.com>
In-Reply-To: <f7280fecf94e4d77498af62b11f26a2a5043e5b4.1642626515.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Jagannathan,

On 19/1/22 22:42, Jagannathan Raman wrote:
> Avocado tests for libvfio-user in QEMU - tests startup,
> hotplug and migration of the server object
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   MAINTAINERS                |   1 +
>   tests/avocado/vfio-user.py | 225 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 226 insertions(+)
>   create mode 100644 tests/avocado/vfio-user.py

> +class VfioUser(QemuSystemTest):
> +    """
> +    :avocado: tags=vfiouser
> +    """
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> +    timeout = 20
> +
> +    @staticmethod
> +    def migration_finished(vm):
> +        res = vm.command('query-migrate')
> +        if 'status' in res:
> +            return res['status'] in ('completed', 'failed')

Do we need to check for failed migration in do_test_migrate()?

> +        else:
> +            return False

[...]

> +    def launch_server_hotplug(self, socket):
> +        server_vm = self.get_vm()
> +        server_vm.add_args('-machine', 'x-remote')
> +        server_vm.add_args('-nodefaults')
> +        server_vm.add_args('-device', 'lsi53c895a,id=lsi1')
> +        server_vm.launch()
> +        server_vm.command('human-monitor-command',
> +                          command_line='object_add x-vfio-user-server,'

Why not use qmp('object-add', ...) directly?

> +                                       'id=vfioobj,socket.type=unix,'
> +                                       'socket.path='+socket+',device=lsi1')
> +        return server_vm

Otherwise LGTM.

