Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F411E433102
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:24:37 +0200 (CEST)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckQH-0007A3-4c
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mckPJ-0006Ui-C7; Tue, 19 Oct 2021 04:23:37 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:46527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mckPH-0001sz-H1; Tue, 19 Oct 2021 04:23:37 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEFfB-1mTA923cNJ-00AEYV; Tue, 19 Oct 2021 10:23:18 +0200
Subject: Re: [PATCH] hw/core/machine: Add the missing delimiter in
 cpu_slot_to_string()
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
References: <20211008075040.18028-1-wangyanan55@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <57481b57-13cf-ee9d-b9ef-205b9e3de610@vivier.eu>
Date: Tue, 19 Oct 2021 10:23:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211008075040.18028-1-wangyanan55@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:T8MP2TxgPnzEajvvyZUaRFA6LUoTxNUlgzHWZasfikHc+DlhBtd
 MjjyW0TgWRuvL0onoTmhSjd5IkM9PMyjL7LhafyTm9kMPchZjiwBtDQSIYyR6E/I2ko5vQ3
 Fo+HwKFzvTfgaZoJ49vI6P0YC5O/W89OjRW951ei1TwpnkMRmqltBFo1CptPa6TS8u8qkhw
 xBgPYG6OB3QXDAJpAerhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wahtiqAGp7Y=:XA/agic6LvCNFYh0gMpp3/
 C/Pxn8ESi9QF0d0xX5xYzcY2SJfD0i5hEvQEAddmif90F8TBNSDEDqazkUyj7mIhvhoc0dAnb
 OqlfZNzIX3IxXqTOk3r9+SGjAUn1/OpF9xi9qd0zgAcJEyqZgnDnBlPAxvLD2ATjq9kOd9www
 k2AEmJV4Hz2g1DmstSFQ+COpuwzyPK1rq7XeDpbDjh/l8JXQGUC1+g7DVq15/fSEqIjHUiQFB
 8H3QYCCtA961asLNRMOdj1lwSMXuEOMuqCy1dyBNtWSz31Yb0c/gNkcU0Bxl0gOkBiwMcZv8C
 wBNjtgAFkboJMSZSt0SVsf7DhL/4vk27blq3RF0sqtiPcfh8RZuJxB3iDz5SXOMdzD7IZCxjL
 1pQ3fo7PYE/hlG1szeLO7Es0CI+KyEuKfFBy8IM8nB76T7D3CgokntfusdYrQrUw/anRy1gxb
 qcW8NLArNMf4tCLhnXKou5jWL44F2cbxAuDGWGru+2IRzW/FVM4Ma3Sz4IIaOFaTMoIvboDFL
 6KalIEnkEMFhMVYTx/w57GQwC/cQm7uaG0GlLtj2rc6FZwMWQgQWS/2xzZ2uvogV+akqifzWq
 7pQc+AuxEk6dFrO8XD2/uXDUCOAG2MKqGxKWVhsxy7OYex7pABFj634Xsn0gFFHraHBCBGNTp
 osAFthNaB8lLKpCD9+N/5teeT5YighTbfgR6CPNsyMdB8449IXM9Sy6HQ4XQWUjEqChI4x4zf
 yG9fyUA/ADaY7iY53eYVpJSCxk8CE2UMqUJLgw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/10/2021 à 09:50, Yanan Wang a écrit :
> The expected output string from cpu_slot_to_string() ought to be
> like "socket-id: *, die-id: *, core-id: *, thread-id: *", so add
> the missing ", " before "die-id". This affects the readability
> of the error message.
> 
> Fixes: 176d2cda0d ("i386/cpu: Consolidate die-id validity in smp context")
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b8d95eec32..0a23ae3106 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1157,6 +1157,9 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>          g_string_append_printf(s, "socket-id: %"PRId64, cpu->props.socket_id);
>      }
>      if (cpu->props.has_die_id) {
> +        if (s->len) {
> +            g_string_append_printf(s, ", ");
> +        }
>          g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
>      }
>      if (cpu->props.has_core_id) {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

