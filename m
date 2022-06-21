Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B36553974
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 20:19:51 +0200 (CEST)
Received: from localhost ([::1]:41960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3iTe-0004s2-7n
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 14:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3iRg-0003q8-LW
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:17:48 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:58045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3iRc-0000zQ-Vp
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:17:48 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mbzhv-1nXfoY0Isp-00dVPx; Tue, 21 Jun 2022 20:17:41 +0200
Message-ID: <63402e61-a23b-6780-fec3-8a0fdf32520a@vivier.eu>
Date: Tue, 21 Jun 2022 20:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH] linux-user: un-parent OBJECT(cpu) when closing thread
Content-Language: fr
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, thuth@redhat.com
References: <20220610143855.1211000-1-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220610143855.1211000-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6Aj4FoDbkDDmNldW4u6s/3E93CtvNQ9885A+XBOd9+6WYYAA4Ev
 5Yq9AJmq1GBHLyC06GTxR7MGi0NlJRv3Tbq4UsGq81syf6W8UGUVjjnVg++LCNpFXcWaMIa
 1t/Zg4ROH8WumWBqv8Vb1Wf0AjF4PJtmAmKwlShzN2bNSB4NBQQ4Ff5PQFy3DiOqdngn4+t
 xnssuYanPcMvXqkwvaOKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:l086qaVMKPA=:X1yyklBr8BPa6jCgiyS6ai
 KMdxOX79h4zhcFxzA9Lt5DLVO0LNkZMBF3V+LlLdXpVjNAqvR8M7Us3J0fcIOvgJ0yXcIIU0h
 2m9TpETTSTAIZQUNYZSGtdqpX7ku9se8vV2VLz6mF712N5pYJi0c1w0on+XN5bi4LYzZ11WWx
 1qDuJ8Utytn3UfzYmDUgxSdiY7vns2Vx0Zkj9glBMhl//lPGRzNjnlCw+XTysLVCwgLXlyory
 SNXTZPGjZLU1FqYCU+ActaX6RHYR2lIvljzxZiwEfmBmSuR3NvpbAWMumO7zKuclOb3AXKEg3
 GcLEl5Ms0B7qxWCRyWR7t5oLGWDiRMGgSiMNarYlLGvi5rckfdhBA2i9iSnayUY0Klr5L6hiT
 01g8tdjklGlHpBBhpXdcr+fxUofjsWsGRbGiDN5cu7quPaF5Kmb61u1ffZHV8to3D4JGRYA4I
 +3tfcg3qwyey3lCgwuY/D6ikO4rHy66grtJ7aNmsAy9wxREIuXaze89JufEHCylqzB8N/jwhT
 rRMvSQyxVffrL23y7vfx9KJWyZsBxamqgAgrSl69K4v6aPS/iBWFdnHk5kfn17dx4CsSr03KB
 UK3eKBE781qAtzZUEpietdZscngxfsohEUvdIZHOie9hqi8rQoOzjlCfEixBscKArk2RMEjPY
 2mrnWDyi8I4r0HB8WO7Wsj26fnQIwXVWBFhh8vB6RWlJXdaQaG0kf8dNw0QSo3cBpwYR+sgiF
 IHgznyFPWh3J4eQuD1Fh9z31hBN3Jd56L0Gscw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/06/2022 à 16:38, Alex Bennée a écrit :
> While forcing the CPU to unrealize by hand does trigger the clean-up
> code we never fully free resources because refcount never reaches
> zero. This is because QOM automatically added objects without an
> explicit parent to /unattached/, incrementing the refcount.
> 
> Instead of manually triggering unrealization just unparent the object
> and let the device machinery deal with that for us.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   linux-user/syscall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f55cdebee5..c413d32311 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8566,7 +8566,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           if (CPU_NEXT(first_cpu)) {
>               TaskState *ts = cpu->opaque;
>   
> -            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
> +            object_unparent(OBJECT(cpu));
>               object_unref(OBJECT(cpu));
>               /*
>                * At this point the CPU should be unrealized and removed

Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


